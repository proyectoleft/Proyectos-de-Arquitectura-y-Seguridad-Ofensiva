# Guía de Despliegue de Active Directory Domain Services (AD DS) en Azure y Configuración de Auditoría

Esta guía detalla el proceso paso a paso para desplegar un entorno de Active Directory (AD DS) utilizando máquinas virtuales en Microsoft Azure con una cuenta gratuita (200 creditos free), asegurando la red y configurando políticas de auditoría para el monitoreo de eventos de seguridad.

Crearemos un grupo de recursos, en el crearemos los dispositivos que contendra el AD y el bastions host (DMZ) con la cuenta gratuita

![alt text](image-1.png)

## 1. Preparación de la Infraestructura de Red

### Creación de la Red Virtual (VNet)

La VNet proporcionará el límite de aislamiento de red para nuestro entorno de Active Directory.

En el portal de Azure, dentro del Grupo de Recursos, seleccione **Crear** y busque **Virtual Network**.

![alt text](image-2.png)

En mi caso

* **Nombre:** VNET1
* **Región:** West Europe (en mi caso)
* **Espacio de direcciones (Address space):** 10.0.0.0/16
* **Subred (Subnet):** 10.0.2.0/24 (Subred por defecto para los equipos del dominio)

> **Nota Arquitectónica:** Para proporcionar salida a internet a esta subred sin exponer los servidores mediante IPs públicas (lo cual sería un riesgo de seguridad crítico), implementaremos posteriormente un NAT Gateway.

![alt text](image-3.png)
![alt text](image-4.png)

## 2. Despliegue de maquinas virtuales (VMs)

**Nota sobre dimensionamiento**: Para despliegues en capa gratuita, es recomendable usar el tamaño Standard_DC1s_v3 (1 vCPU, 8 GiB de memoria), ya que la cuota máxima permitida suele ser de 4 vCPUs en total

### 2.1 Creacion de Bastion Host (windows 10)

**¿Por qué hacerlo?**: Un Jump Server actúa como el único punto de entrada expuesto para administrar la infraestructura, reduciendo significativamente la superficie de ataque

En nuestro grupo, en la parte superior darle a crear y buscar "Windows 10"

* **Imagen:** Windows 10 Enterprise, version 22H2
* **Tamaño:** Standard_DC1s_v3
    * Ir a **mas tamaños** y en filtros colocar de 0 a 1 vCPU, ya que la cuanetra gratuita solo permite 4 vcpu como maximo
* **Opciones de disponibilidad:** Sin redundancia
* **Tipo de seguridad:** Estándar
    

**Credenciales de Administrador Local:**
* **Usuario:** `<TU_USUARIO>`
* **Contraseña:** `<TU_CONTRASEÑA>`

**Redes y Licencias:**
* Permitir puertos de entrada públicos: **RDP (3389)**, para acceder desde nuestra PC local.

* Marcar la casilla de confirmación de licencias.

![alt text](image-5.png)

![alt text](image-6.png)

![alt text](image-7.png)

### 2.2 Creacion de Windows Server (WS1)

En nuestro grupo, en la parte superior darle a crear y buscar "Windows server"

* **Nombre:** WS1
* **Opciones de disponibilidad:** Sin redundacia
* **Tipo de seguridad:** Estandar
* **Imagen:** [smalldisk] Windows Server 2022 Datacenter: Azure Edition
* **Tamaño:** Standard_DC1s_v3 - 1 vcpu

**Credenciales**
* **Usuario:** `<TU_USUARIO>`
* **Contraseña:** `<TU_CONTRASEÑA>`

En el apartado de redes

**Configuración de Red (Aislamiento):**
Para aislar el AD, este servidor **no** debe tener IP Pública.
* **Red virtual:** VNET1
* **Subred:** default (10.0.2.0/24)
* **IP pública:** Ninguno
* **Grupo de seguridad de red (NSG):** Avanzado -> Crear nuevo (Ej: NSG-Interno).

![alt text](image-9.png)
![alt text](image-8.png)

### 2.3 Creacion de w01 (windows 10)

* **Nombres:** W01
* **Opciones de disponibilidad:** Sin redundacia
* **Tipo de seguridad:** Estandar
* **Imagen:** Windows 10 Enterprise, version 22H2
* **Tamaño:** Standard_DC1s_v3 - 1 vcpu

**Credenciales**
* **Usuario:** `<TU_USUARIO>`
* **Contraseña:** `<TU_CONTRASEÑA>`

Ademas

* Permitir RDP
* Marcar la casilla de licencias

En el apartado de redes

![alt text](image-10.png)

### 2.4 Creacion de W02 (Windows 10)

* **Nombre:** W02
* **Opciones de disponibilidad:** Sin redundacia
* **Tipo de seguridad:** Estandar
* **Imagen:** Windows 10 enterprise version 22H2
* **Tamaño:** Standard_DC1s_v3 - 1 vcpu

**Credenciales**
* **Usuario:** `<TU_USUARIO>`
* **Contraseña:** `<TU_CONTRASEÑA>`

Ademas

* Permitir RDP
* Marcar la casilla de licencias

En el apartado de redes

![alt text](image-11.png)

### 2.4 Asignación de IP Estática en Azure

En mi caso, asignare las siguiente IPs en mis maquinas virtuales

* **WS1 (Controlador de Dominio):** 10.0.2.100
* **W01:** 10.0.2.10
* **W02:** 10.0.2.20

**Pasos:**
1. Seleccione la VM > **Redes** > Haga clic en la **Interfaz de red** adjunta.
2. Vaya a **Configuraciones de IP** > Seleccione `ipconfig1`.
3. Cambie la Asignación de Dinámica a **Estática** e ingrese la IP correspondiente. Guarde los cambios.

![alt text](image-12.png)

### 2.5 Configuración de Salida a Internet (NAT Gateway)

Para que nuestra red interna (sin IPs públicas) pueda descargar actualizaciones, instalar roles y enviar logs a Log Analytics, requiere salida a Internet.

![alt text](image-13.png)

En el apartado de IP de Salida

 daremos click en **"agregar prefijos o direcciones ip publica"** y en crear una direccion IP publica, **Le agregamos un nombre, verison de ip en IPv4**

![alt text](image-15.png)

En el apartado de redes

![alt text](image-16.png)

## 3. Despliegue de Active Directory (AD DS)

### 3.1 Conexion via RDP bastionhost a WS1

IP de Bastion host

![alt text](image-18.png)

IP de WS1

![alt text](image-17.png)

1. En nuestro windows buscamos "conexion escritorio remoto", entrar con la ip de nuestro bastion host que en mi caso sera 20.86.162.182

**Credenciales**
* **Usuario:** `<TU_USUARIO>`
* **Contraseña:** `<TU_CONTRASEÑA>`

2. Acepte las configuraciones iniciales de privacidad de windows 10 y confirme el descubrimiento de red ("Yes").


Credenciales WS1:

* **WS1:** 10.0.2.100
* **Usuario:** `<TU_USUARIO>`
* **Contraseña:** `<TU_CONTRASEÑA>`

![alt text](image-19.png)

En WS1 se mostrara la pantalla del Administrador del servidor (Server Manager) es donde configuraremos todo.

### 3.2 Instalar el rol de Active Directory (AD DS)**

1. En el panel central, bajo "WELCOME TO SERVER MANAGER", haz clic en la opción azul "2 Add roles and features" (Agregar roles y características).

2. Se abrirá una nueva ventana con un asistente. En la primera pantalla informativa ("Before you begin"), simplemente haz clic en **Next.**

3. En la sección **"Installation Type"**, deja marcada la primera opción **"Role-based or feature-based installation"** y haz clic en**Next.**

4. En **"Server Selection"**, tu servidor actual (debería llamarse algo como WS1, en mi caso) ya estará seleccionado por defecto. Solo haz clic en Next.

5. ¡Paso Clave! Llegarás a la lista de "Server Roles". Busca en la lista y marca la casilla que dice **"Active Directory Domain Services".**

6. Inmediatamente saltará una pequeña ventana emergente indicando que se necesitan otras herramientas. Haz clic en el botón "Add Features" (Agregar características) dentro de esa ventanita, y luego haz clic en Next.
![alt text](image-20.png)


7. En las siguientes pantallas ("Features" y "AD DS"), no cambiar nada, Solo hacer clic en **Next** hasta llegar al final.

8. En la última pantalla, haz clic en Install (Instalar).

### 3.3 Promoción del Servidor a Controlador de Dominio

En la parte superior derecha de tu pantalla del Server Manager. Hay un ícono de una bandera con un pequeño triángulo amarillo de advertencia, hacer click

![alt text](image-21.png)

Se desplegará un menú. Ahí mismo aparecera el enlace azul que dice: **"Promote this server to a domain controller"** (Promover este servidor a controlador de dominio). Haz clic en ese enlace.

1. Seleccionar la tercera opción: **"Add a new forest"** (Agregar un nuevo bosque).

2. En la casilla de **"Root domain name"** (Nombre de dominio raíz), debes escribir el nombre de tu dominio, en mi caso "Contoso2.corp"
![alt text](image-22.png)

3. Haz clic en Next, en la siguiente pantalla te pedirá que crees una contraseña de recuperación (DSRM password)
4. Darle a **"next"** en los siguientes apartados hasta llegar al final y darle al boton **"install"**. Al terminar, el servidor se reiniciará solo para aplicar los cambios
5. Volvemos al bastion, hacemos el cambio a CONTOSO y nos conectamos

## 4. Gestión de Usuarios y Unión al Dominio

### 4.1 Creación de Usuarios (Active Directory Users and Computers)

1. Vaya a **Tools** > **Active Directory Users and Computers**.
2. Expanda el dominio `Contoso2.corp`, haga clic derecho en **Users** > **New** > **User**.
![alt text](image-23.png)

![alt text](image-24.png)

3. En mi caso creare: `USER01` y `USER02`.
4. Asigne contraseñas. Para este laboratorio, marque **Password never expires** para evitar interrupciones por caducidad de credenciales.

![alt text](image-25.png)

![alt text](image-26.png)

### 4.2 Configuración de DNS y Unión de Equipos (W01 y W02)

Para que los equipos puedan resolver el nombre de dominio (`Contoso2.corp`), deben apuntar al servidor DNS correcto (el Controlador de Dominio).

Desde WS1 via nos conectaremos  W01 y W02 via RDP

![alt text](image-27.png)

**Credenciales W01:**
* **ip**: 10.0.2.10
* **Usuario:** `<TU_USUARIO>`
* **Contraseña:** `<TU_CONTRASEÑA>`

**Credenciales W02:**
* **ip**: 10.0.2.20
* **Usuario:** `<TU_USUARIO>`
* **Contraseña:** `<TU_CONTRASEÑA>`

1. En la maquina buscamos **"network view conexions"**
2. Click derecho e ir a propiedades y abirmos el IPV4
3. Hacemos que el DNS apunte a la IP de nuestro WS1
![alt text](image-28.png)

**Unión al Dominio:**

Ahora buscamos **"about your pc"**

1. Buscar **"advance system settings"**
2. Ir a la petaña *computer name*, y hacer click en **change**
3. En la sección **"menber of"**, seleccionar **Domain** y escribir el dominio, en mi caso exactamente: *Contoso2.corp*.
4. Pediran las credencial del administrador de dominio, osea de WS1

    * Usuario: CONTOSO2\`<TU_USUARIO>`
    * Contraseña: `<TU_USUARIO>`

![alt text](image-29.png)

Ahora nos moveremos de *"computer name"* hacia el apartado *"Remote"*:

1. Vamos a *select user*, clickeamos en **"ADD"**
2. Agregaremos USER01 y USER 02, escribimos uno por uno, *USER01*  darle a checkname y agregarlos, colocar las credenciales del administrador de dominio
![alt text](image-30.png)

**¡¡¡Repetir lo mismo para W02!!!**

## 5. Auditoría Centralizada

La habilitación de políticas de auditoría es fundamental para rastrear eventos de seguridad, escalada de privilegios o movimientos laterales en el dominio.

### 5.1 Habilitar Políticas de Auditoría (GPO)

En WS1, abrir **Tools** > **Group Policy Management**.

1. Expanda el bosque > *Domains* > `Contoso2.corp`.
2. Haga clic derecho en **Default Domain Policy** y seleccione **Edit**.
![alt text](image-31.png)

3. Naveguar a: `Computer Configuration > Policies > Windows Settings > Security Settings > Local Policies > Audit Policy`.
4. Configure **Audit account logon events** y **Audit logon events**, marcando las casillas de **Success** (Éxito) y **Failure** (Error).

![alt text](image-32.png)

### Revision de LOGS

1.  En el Server Manager,en Tools y abrir el Event Viewer 
2.	En el panel izquierdo, despliega la carpeta Windows Logs y haz clic en Security.
3.	Se vera una lista enorme de eventos. En el panel de la derecha, haz clic en Filter Current Log... (Filtrar registro actual...).
![alt text](image-33.png)
4.	En el medio que dice <All Event IDs>, escribe el número del ID del evento, por ejemplo 4720 y dale OK.
5.	Vuelve a darle a Filter Current Log..., borra el número y ahora pon 4625 (Fallo al iniciar sesión) o 4624 (Inicio exitoso).


### 5.2 Integración con Azure Log Analytics (SIEM)

### A. Alistar el contenedor

1. Busque **Log Analytics workspaces**o **Áreas de trabajo de Log Analytics** en Azure y seleccione Crear. (fura del grupo)

![alt text](image-34.png)

Ahora vamos a crear tu contenedor de logs paso a paso:

2. clic en ese botón que dice **+ Crear**, se te abrirá una pantalla con un formulario, llenar estos datos en la pestaña Datos básicos:

3. Suscripción: Escoger tu tipo de suscripcion

4. Grupo de recursos: Despliega y seleccionar, en mi caso(CBN08-Cardenas).

5. Nombre: en mi caso LogAnalytics-CBN08

6. Región: ¡Muy importante! Asegurarse de poner la misma región donde creaste tus máquinas virtuales (En mi caso West Europe).

![alt text](image-35.png)

### B. Regla de Recopilación de Datos (Data Collection Rule - DCR)

La DCR define qué datos se recopilan y adónde se envían. Azure instalará automáticamente el **Azure Monitor Agent (AMA)** en las máquinas virtuales seleccionadas.

**Paso 1: Encontrar el servicio**

1. Ve a la barra de búsqueda superior de Azure, busque **Data Collection Rules** o **Reglas de recopilación de datos** y seleccione *Crear*.

![alt text](image-37.png)

**Paso 2: Pestaña "Datos básicos"**

1. Nombre de la regla: en mi caso puse Regla-Auditoria-WS1.

2. Suscripción y Grupo de Recursos: Selecciona su grupo, en mi caso CBN08-Cardenas.

3. Región: en la que creaste todas tus maquinas, en mic aso West Europe.

4. Tipo de plataforma: Selecciona Windows.

**Paso 3: Pestaña "Recursos"**

Aquí es donde le decimos a quién vigilar.

1. Haz clic en el botón + Agregar recursos.

2. Se abrirá un panel. Despliega tu suscripción y tu grupo de recursos hasta que veas tus máquinas virtuales.

3. Marca la casilla de tu servidor WS1, w01 y w02 (o solo en las maquinas que desees)

4. Dale a Aplicar.

![alt text](image-38.png)
![alt text](image-39.png)

**Paso 4: Pestaña "Recopilar y entregar"**

Aquí le decimos qué información queremos y a dónde va.

1. Haz clic en **+ Agregar origen de datos.**

2. Tipo de origen de datos: En mi caso seleccione **Registros de eventos de Windows (Windows Event Logs)**.

3. En mi caso uso (Basic / Custom). En la lista de eventos básicos y marco las 2 opciones de seguridad (Aquí es donde viven los logs de Logon y Account Management ).
![alt text](image-40.png)

4. En la pestaña *Destino*, darle click a **"agregar destino"**.

![alt text](image-41.png)

5. Guardamos y por ultimo creamos


### Gneracion de log:

Cuando cree un nuevo usuario en el AD o realice un inicio de sesión, el evento se registrará localmente en WS1. El agente AMA detectará el evento (ej. `EventID 4720` es caso de crear un nuevo usuario en el AD), la regla DCR lo validará y lo enviará mediante el NAT Gateway hacia Log Analytics.

Para verificar la ingesta de telemetría:
1. Navegue a su Log Analytics Workspace > **Logs**.
2. Ejecute la siguiente consulta en lenguaje KQL (Kusto Query Language) en la tabla `SecurityEvent`:

    Event
    | where EventID == 4720

![alt text](image-42.png)
