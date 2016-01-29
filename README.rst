===========
GvGeoPortal
===========

--------------------------
Documento de desarrollador
--------------------------

:Company:   Generalitat Valenciana, Conselleria de Hacienda y Administración Pública
:Author:    DISID Corporation
:Revision:  $Rev$
:Date:      $Date$
:Copyright: 2015 (c) DISID Corporation

.. contents::
   :depth: 2
   :backlinks: none

Gestión del proyecto
====================

* Control de versiones: http://subversion.gva.es/svn/geomatica/gvgeoportal/trunk
* Gestor tareas DISID: http://projects.disid.com/redmine/projects/geomatica-gva

Documentación
=============

La documentación principal del proyecto se puede encontrar dentro de la carpeta del SVN:

http://subversion.gva.es/svn/geomatica/gvgeoportal/trunk/doc/03_desarrollo/analisis/ENT-31323_gvGeoportal_Analisis-aplicacion-gestor-Geoportales-Corporativos

De especial interés es el documento "GVGEOPORTAL_ENT-31323_ANALISIS_APLICACION.odt".


Herramientas de desarrollo
==========================

* Ultima versión de Sun JDK 6 (usado para esta guía la versión jdk1.6.0_45).

  * Descargar de la ruta http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html#jdk-6u45-oth-JPR

* JBoss EAP 6.2.

  * http://jbossas.jboss.org/downloads/

* Maven 3 (usado para esta guía la version 3.2.1).

  * https://maven.apache.org/download.cgi

Entorno de ejecución
--------------------

* gvNIX 1.5.0.RELEASE (http://sourceforge.net/projects/gvnix/)

  * OJO, para el entorno de desarrollo se trabaja directamente sobre la versión gvNIX 1.5.0.BUILD-SNAPSHOT. De este modo se tienen los últimos cambios realizados y que se necesitarán durante el desarrollo de la aplicación.

  * Para configurar el equipo de desarrollo para utilizar esta versión seguir los pasos explicados en el fichero:

    http://subversion.gva.es/svn/gvnix/gvnix/branches/BRANCH_GVNIX_01.05.00/fuentes/readme.md

* Eclipse STS 3.6.4 (https://spring.io/tools/sts/all)
  Con el siguiente plugin instalado:

  + Subclipse (http://subclipse.tigris.org/).

Base de datos
=============

PostgreSQL 9.4 + PostGIS 2.1.7

Navegadores
===========

* Firefox, version 38.0.
* Chrome, version 28.0

Idiomas
=======

* Español
* Valenciano

Está aplicado el soporte multiidioma.

Entornos
========

* Local: http://localhost:8080/gvgeoportal

Desarrollo
==========

Instalación GVNIX
-----------------

Seguir guía de instalación de la página https://github.com/DISID/gvnix-samples/blob/master/INSTALL-gvNIX.adoc

Instalación STS
---------------

* Descargar STS de https://spring.io/tools/sts/all

* Instalar Roo Extension (explicado en la guía de instalación gvnix)

* Instalar soporte GVNIX (explicado en la guía de instalación gvnix)

* Instalación plugin subeclipse (help - install new Software - add (subeclipse - http://subclipse.tigris.org/update_1.10.x))

* Añadir jdk1.6.0_45 a STS

  * Windows - Preferences - Java - Installed JREs - Add

  * Seleccionar Standar VM y localizar en directorio local jdk descargada.

  * Guardar cambios y seleccionar la jdk como jdk predeterminada.

* Añadir y Configurar servidor JBOSS en STS.

  * Windows - Preferences - Server - Runtime Environment -Add

  * Navegar hasta seleccionar "JBoss Enterprires Platform 6.1+"

  * En home Directory seleccionar la ruta en local donde ha sido descargado JBoss. Seleccionar también la jdk1.6.0_45

  * Pulsar finalizar y aparecerá el servidor en la pestaña "servers"

  * Se recomienda modificar los parámetros de memoria con los que trabaja el servidor. Para ello:

    * En la pantalla de opciones de la configuración del servidor acceder a Open launch configuration

    * En la nueva ventana, en la pestaña Arguments añadir al final del texo que aparece en el apartado VM Arguments lo siguiente: "-Xms128m -Xmx512m -XX:MaxPermSize=256m -XX:PermSize=256m"

* Eliminar validaciones en eclipse. Se recomienda desactivarlas para no penalizar el rendimiento.

  * Windows - Preferences - Validator y seleccionar el check "suspend all validators"

* Se recomienda instalar plugin AnyEdit Tool para la codificación de los properties

  * Nombre: AnyEdit Tools
  *  URL:   http://andrei.gmxhome.de/eclipse/


Importar proyecto a Eclipse
----------------------------

* Para importar el proyecto de trabajo en STS realizar los siguientes pasos:

  * File > Import > Checkout projects from SVN

  * En este punto completar los datos

* Si se desea importar el proyecto utilizando la línea de comandos en primer lugar es necesario bajarse el repositorio SVN:

  * svn checkout http://subversion.gva.es/svn/geomatica/gvgeoportal/trunk/fuentes.

* Después de esto, para importar el proyecto:

  * File > Import > Maven > Existing Maven Project, y seleccionar la carpeta que contiene el proyecto.

* Convertir el proyecto a Maven: ``Configure > Convert to Maven Project``.

.. admonition:: Maven Dependency Problems

   Si existen problemas de dependencias con Maven debes de bajar dichas dependencias desde consola:

   #. Abrir una consola e ir al root del proyecto.

   #. Ejecutar::

        mvn compile

   #. Actualizar proyectos desde Eclipse: ``Maven > Update Project``

* Tal vez durante el proceso de importación se muestre una ventana con el titulo
  *Should convert legacy STS projects?* Selecciona *Do not show this dialog
  again.* Y pulsar *N*.

* Este proceso arrancará probablemente el Shell de Roo, esperar a que finalice el proceso completo hasta que el Shell de Roo esté operativo y entonces se puede empezar a trabajar con el shell o salir con el comando exit.

* Una vez importado el proyecto, abrir las propiedades del mismo y buscar "Maven" y en el campo "Active Maven Profiles" poner, para utilizar el perfil de desarrollo::

    dev

* Se recomienda para corregir errores javascript de datatables realizar los siguientes pasos:

  * Botón derecho sobre proyecto - properties
  * Javascript - include path - pestaña source
  * Eliminar cualquier referencia que hubiera incluida aquí dentro.

Gestión con SVN
---------------

La aplicación está subida directamente en la carpeta fuentes del proyecto:

http://subversion.gva.es/svn/geomatica/gvgeoportal/trunk/fuentes

A la hora de realizar commits de los cambios realizados es recomendable rellenar el campo asunto# con la clave de Jira asociada a la tarea, por ejemplo:

ENT-44310 (Correspondiente a la tarea [gvGeoportal] Desarrollo Fase 1)

Para no subir ficheros innecesarios a jira como aquellos que hacen referencia a .project, .classpath o .settings ...se recomienda añadirlos a "svn:ignore" desde la ventana Team Sincronice y pulsando botón derecho ratón sobre los mismos.

Instalación de Postgres+PostGIS en ubuntu 14.04
-----------------------------------------------

Los pasos a seguir para realizar la instalación son:

#. Entramos en la consola de Linux y escribimos::

    sudo apt-get update
    sudo apt-get install postgresql postgresql-client postgresql-contrib pgadmin3 postgis

#. Tras la instalación ejecutamos las siguientes órdenes::

    sudo su root
    su postgres
    psql
     //Con este comando entramos en la base de datos,
       donde podemos interactuar en modo consola.

#. Una vez dentro de psql, escribimos::

    \password postgres

#. Debe aparecer lo siguiente::

    Enter new password:
     //Tecleamos postgres (por ejemplo)

#. Y además::

    Enter it again::
    postgres=#
     //Tecleamos postgres (o el password que hayamos
       escrito en el anterior paso)

#. Ahora salimos de psql::

    \q

Para añadir funcionalidad espacial a la base de datos se debe realizar sobre nuestra base de datos mediante psql y creamos una extensión nueva ejecutando::

    CREATE EXTENSION postgis;

Además, para añadir soporte de topología es necesario crear una nueva extensión::

    CREATE EXTENSION postgis_topology;

Creación BBDD
'''''''''''''

Para crear la bbdd en PostgreSQL para el proyecto realizar los siguientes pasos:

#. Cambiar el usuario a postgres::

    sudo su postgres

#. Crear el usuario de la BBDD::

    createuser -W -s -D -P gvgeoportal

  + Nota: El usuario debe ser *superuser* para poder habilitar la extensión *postgis*

#. Establecer password *gvgeoportal* (Se requerirá 3 veces).

#. Crear la DDBB::

    createdb -E UTF-8 -O gvgeoportal gvGeoPortalDB

#. Habilitar extensión postgis ::

    psql -d gvGeoPortalDB -c "CREATE EXTENSION postgis;"

Para borrar la DDBB ejecutar::

    dropdb gvGeoPortalDB

gvSIG Web Framework
-------------------

El proyecto gvgeoportal utiliza este framework el cual incluye varias herramientas geograficas.

Para instalarse el proyecto en entorno local es necesario ejecutar el siguiente comando en la ruta donde se quiera instalar, por ejemplo:

"/home/nombreUsuario/projects/git/"

  git clone https://github.com/gvSIGAssociation/gvsig-web-fw.git

Este comando baja el proyecto de la url dada al entorno local.

Una vez descargado el proyecto, es necesario ejecutar el siguiene comando:

  mvn clean install

Cada vez que se quiera actualizar los cambios del framework, se ejecutará el comando:

  git pull

Después de este comando es necesario volver a ejecutar "mvn clean install".

Finalmente, desde STS será necesario realizar un clean del proyecto para que los cambios tengan efecto.

Ciertas veces puede ser necesario seleccionar también la opción de maven "update project" del proyecto.

Liquibase
----------

Se utiliza Liquibase para gestionar cambios en la BBDD. Esto significa que cada cambio realizado en la base de datos es almacenado en *change sets* para fácilmente aplicarlo en el futuro.

Cada cambio se realiza por *change sets* configurados en un *change log file*. Todos los *change logs* está localizados en la carpeta ``src/main/resources/db/``, con el nombre ``db.changelog-VERSION-TYPE.xml``, donde *VERSION* es la versión del change log, y el *TYPE* es el tipo de modificación hecha, de la siguiente forma:

* *schema*: modificaciones hechas en el esquema de la BBDD (creación o modificación de tablas, etc.)

* *seed*: inserciones de datos semilla in gvGeoPortal.

* *demo*: inserciones de datos de demo.

Dedica un momento a consultar los change logs de gvGeoPortal y
http://www.liquibase.org/ para más información.

Carga de datos
'''''''''''''''

Liquibase es utilizado también para cargar datos usando el plugin integrado de
Maven.

Para cargar datos debes ejecutar en la carpeta raíz del proyecto desde consola
(la cual contiene el fichero pom.xml)::

  $ mvn clean compile liquibase:update -Pdev

Nota que la ejecución se está realizando sobre el perfil de ``dev``, utilizado
para desarrollo.

El comando anterior ejecutará lo siguiente:

* Carga del esquema (creación de tablas, claves primarias y externas y restricciones).
* Carga de datos semilla.
* Carga de datos de demo.

Cada punto es un change log ubicado en ``src/main/resources/db/``.

Recargar toda la BBDD
''''''''''''''''''''''

Para recargar la base de datos:

#. Usa postgres::

    sudo su postgres

#. Borra la BBDD haciendo esto::

    dropdb gvGeoPortalDB

#. Crea una nueva BBDD::

    createdb -E UTF-8 -O gvgeoportal gvGeoPortalDB

#. Habilita la extensión postgis::

    psql -d gvGeoPortalDB -c "CREATE EXTENSION postgis;"

#. Ejecuta::

  mvn clean compile liquibase:update -Pdev

"-Pdev" es utilizado para cambiar el perfil. En este caso "dev" es el perfil
para desarrollo.

Revertir modificaciones
''''''''''''''''''''''''

Para cada carga de modificaciones en la base de datos se crea un *tag*,
For each load of modifications a *tag* is created in database, que permite
revertir el estado de la base de datos al estado de cuando fue etiquetado.

Para revertir modificaciones, hacer esto:

#. Abre una consola y ves a la raíz del proyecto.
#. Ejecuta la acción rollback de Liquibase::

     mvn liquibase:rollback -Dliquibase.rollbackTag=TAG_NAME -Pdev

   Donde ``TAG_NAME`` es el nombre del *tag*. Los nombre de los tags están
   ubicados al final de cada fichero *changelog*, consulta el valor del elemento
   ``tagDatabase``.

Hay que tener en cuenta que esto no deshace modificaciones de la BBDD realizadas manualmente.

Actualización de la base de datos
''''''''''''''''''''''''''''''''''

Cada modificación hecha en el esquema de la BBDD realizada debe ser un change set en un fichero change log.

Para crear un change log con los change sets hacer esto:

#. Crea un nuevo fichero en la carpeta ``src/main/resources/db/`` con el nombre ``db.changelog-VERSION-TYPE.xml``.

#. Añade al nuevo change log los change sets con las modificaciones, carga de datos, etc.

Puedes consultar todos los chage sets soportados por Liquibase en su página http://www.liquibase.org/documentation/changes/index.html.

Instalación y configuración jboss-eap-6.2
------------------------------------------

* Descargar jboss-eap-6.2 (http://jbossas.jboss.org/downloads/)
* Seguir documento http://subversion.gva.es/svn/gvnix/gvnix/branches/BRANCH_GVNIX_01.05.00/doc/deployment-jboss/gvnix-jboss-deployment.odt para poder realizar deploy con Gvnix en Jboss.

Configuración standalone
'''''''''''''''''''''''''

Tienes que realizar la configuración que desees en el archivo ``$JBOSS_HOME/standalone/configuration/standalone.xml``.

Configura las propiedades ``asa.conf`` (ruta de ficheros externos) y ``asa.log``:

  .. code::

    ....
    </extensions>

    <system-properties>
        <property name="asa.conf" value="/tmp"/>
        <property name="asa.logs" value="/tmp"/>
    </system-properties>

    <management>
    ...

Tienes que añadir los siguientes datasources y drivers a este fichero:

  .. code::

    ....
    <datasources>
				<datasource jndi-name="java:jboss/datasources/gvGeoPortalDataSource" pool-name="gvGeoPortalDataSource" enabled="true" use-java-context="true">
   					<connection-url>jdbc:postgresql://localhost:5432/gvGeoPortalDB</connection-url>
       			<driver>postgresql</driver>
       			<security>
            		<user-name>gvgeoportal</user-name>
            		<password>gvgeoportal</password>
       			</security>
				</datasource>
        <drivers>
            <driver name="postgresql" module="com.postgresql.jdbc4">
                <driver-class>org.postgresql.Driver</driver-class>
                <xa-datasource-class>org.postgresql.xa.PGXADataSource</xa-datasource-class>
            </driver>
        </drivers>
    </datasources>
    ....

Módulos
""""""""

Tienes que incluir los siguientes módulos en JBoss:

* $JBOSS_HOME/modules/com/postgresql/jdbc4/main: añade "postgresql-9.3-1102-jdbc4.jar", "postgis-jdbc-1.5.2.jar" y "module.xml".
  "module.xml" tiene el siguiente código:

  .. code::

    ....
    <?xml version="1.0" encoding="UTF-8"?>
			<module xmlns="urn:jboss:module:1.1" name="com.postgresql.jdbc4">
  			<resources>
    		<resource-root path="postgresql-9.3-1102-jdbc4.jar"/>
    			<resource-root path="postgis-jdbc-1.5.2.jar"/>
  			</resources>
  			<dependencies>
    			<module name="javax.api"/>
    			<module name="javax.transaction.api"/>
  			</dependencies>
			</module>
    ....

Configuración de propiedades externas en proyecto
--------------------------------------------------

Seguir configuraciones marcadas en el documento http://subversion.gva.es/svn/gvnix/gvnix/branches/BRANCH_GVNIX_01.05.00/doc/external-configuration/gvnix-external-configuration.odt

En el fichero de propiedades que generaremos en la ruta definida para la variable "asa.conf" (definida en el fichero external-configuration/gvnix-external-configuration.odt), se debe generar el directorio gvgeoportal, y dentro de este, un fichero gvgeoportal.properties. En dicho fichero definir las propiedades:

  .. code::

    # DBGvGeoPortal PostgreSQL
    # Para la configuración de la BBDD:
		database.jndi.name=java:jboss/datasources/gvGeoPortalDataSource
		database.schema=public
		database.dialect=org.hibernate.dialect.PostgreSQLDialect

		# Logging
		# Para la configuración del log4j:
		log4j.category.es.gva.dgti.gvgeoportal=DEBUG, R
		log4j.additivity.es.gva.dgti.gvgeoportal=false
		log4j.rootLogger=DEBUG, R
		log4j.appender.R.File=${asa.logs}/gvgeoportal/gvgeoportal.log
		log4j.appender.stdout=org.apache.log4j.ConsoleAppender
		log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
		log4j.appender.stdout.layout.ConversionPattern=%d [%t] %-5p %c - %m%n
		log4j.appender.R=org.apache.log4j.RollingFileAppender
		log4j.appender.R.MaxFileSize=100KB
		log4j.appender.R.MaxBackupIndex=1
		log4j.appender.R.layout=org.apache.log4j.PatternLayout
		log4j.appender.R.layout.ConversionPattern=%p %t %c - %m%n

		# SAFE
		security.SAFE.mapRoles=true
		security.SAFE.active=true
		security.SAFE.autorizacion.poraplicacion=false
		#Mandatory to use SAFE Provider
		security.SAFE.appId=
		security.SAFE.environment=DESA
		security.SAFE.alias.password=43598
		security.SAFE.keystore.password=changeit
		security.SAFE.keystore.type.keystore=JKS
		security.SAFE.keystore.file=/home/USER/software/java/jdk1.6.0_45/jre/lib/security/cacerts
		security.SAFE.keystore.alias=geoticdescert
		security.SAFE.applet.location=
		security.SAFE.propertiesPath=file:///PATH/gvgeoportal/safe.properties
		security.SAFE.traceabilityId=1aa25d39e7ef6acf-GVGEOPORTAL-
		wsdl.SAFE.location= https://preinterint.gva.es/eSirca_Bus/ins/Proxy/SAFE/AutenticacionArangi_v1_00?wsdl
		wsdl.SAFEAutorizacion.location=https://preinterint.gva.es:443/eSirca_Bus/ins/Proxy/SAFE/AutorizacionHDFI_v1_00?wsdl

En el mismo directorio en el que está contenido el fichero de propiedades externas anterior se generará otro fichero de propiedades llamado *safe.properties*, y su ruta se establecerá en la propiedad "security.SAFE.propertiesPath" del fichero anterior. Los valores del fichero serán los siguientes:

  .. code::

    org.apache.ws.security.crypto.provider=org.apache.ws.security.components.crypto.Merlin
    org.apache.ws.security.crypto.merlin.file=/home/USER/software/java/jdk1.6.0_45/jre/lib/security/cacerts
    org.apache.ws.security.crypto.merlin.keystore.type=JKS
    org.apache.ws.security.crypto.merlin.keystore.alias=geoticdescert
    org.apache.ws.security.crypto.merlin.alias.password=43598
    org.apache.ws.security.crypto.merlin.keystore.password=changeit

Configuración de test unitarios
-------------------------------

Para poder ejecutar los test unitarios en la aplicación será necesario realizar una serie de configuraciones previas.

* En el fichero ApplicationContext.xml añadir las siguienes líneas de código:

  La referencia al fichero de properties para test:

  .. code::

    <value>classpath:gvgeoportal-test.properties</value>

  Los datos de conexión:

  .. code::

  	 <!-- DB gvGeoportal PostgreSQL (para test) -->
  	 <bean autowire-candidate="false" class="org.apache.commons.dbcp.BasicDataSource" id="testGvGeoPortalDataSource">
     	<property name="url" value="${test.database.url}" />
     	<property name="username" value="${test.database.username}" />
     	<property name="password" value="${test.database.password}" />
     	<property name="driverClassName" value="${test.database.driverClassName}" />
  	 </bean>

* Añadir el fichero de properties de test:

  /src/main/resources/gvgeoportal-test.properties

  Este fichero contendrá las siguientes propiedades:

  # DBGvgeoPortal (para test)

  .. code::

		 test.database.url=${test.db.url}
     test.database.username=${test.db.username}
     test.database.password=${test.db.password}
     test.database.driverClassName=${test.db.driverClassName}

* En el fichero pom.xml añadir datos de conexión (ojo hacerlo para todos los profiles):

  .. code::

  	<!-- Propiedades por defecto (para test) -->
		<!-- DB gvgeoportal -->
		<test.db.url>jdbc:postgresql://localhost:5432/gvGeoPortalDB</test.db.url>
		<test.db.username>xxxxxxxx</test.db.username>
		<test.db.password>xxxxxxx</test.db.password>
		<test.db.driverClassName>org.postgresql.Driver</test.db.driverClassName>
		<db.dialect>org.hibernate.spatial.dialect.postgis.PostgisDialect</db.dialect>
		<db.schema>public</db.schema>
		<db.jndi.name>jdbc/gvGeoPortalDataSource</db.jndi.name>

Configuración para SAFE
------------------------

#. Obtén los 4 certificados:

   * sello.sw_PREPRODUCCION_INSTRUMENTALES.p12

   * ACCVRAIZ1

   * ACCVCA-120

   * preinterint.gva.es

#. Para instalarlos debes ejecutar:

   .. code::

	    keytool -importkeystore -srckeystore USER_PATH_TO_CERTIFICATE/sello.sw_PREPRODUCCION_INSTRUMENTALES.p12 -destkeystore /home/USER/software/java/jdk1.6.0_45/jre/lib/security/cacerts -srcstoretype PKCS12 -deststoretype JKS -srcstorepass 43598 -deststorepass changeit -srcalias '1' -destalias geoticdescert -trustcacerts

   (reemplaza -srckeystore y -destkeystore con la ruta correspondiente).

   .. code::

 	    keytool -import -alias ACCVRAIZ1 -keystore /home/USER/software/java/jdk1.6.0_45/jre/lib/security/cacerts -trustcacerts -file USER_PATH_TO_CERTIFICATE/ACCVRAIZ1
	    keytool -import -alias ACCVCA-120 -keystore /home/USER/software/java/jdk1.6.0_45/jre/lib/security/cacerts -trustcacerts -file USER_PATH_TO_CERTIFICATE/ACCVCA-120
	    keytool -import -alias preinterint.gva.es -keystore /home/USER/software/java/jdk1.6.0_45/jre/lib/security/cacerts -trustcacerts -file USER_PATH_TO_CERTIFICATE/preinterint.gva.es

   "-keystore" y "-file" deben ser reemplazadas con sus respectivas rutas.

   El password por defecto para el cacerts es: "changeit".

#. Ahora tienes que comprobar que los certificados se han instalado correctamente:

   .. code::

	    keytool -list -v -keystore /home/USER/software/java/jdk1.6.0_45/jre/lib/security/cacerts

   Si todo es correcto, los cuatro certificados aparecerán en la lista.

#. A continuación, debes configurar el pom.xml, reemplazando el valor de "security.SAFE.keystore.file" por la ruta del cacerts que se está utilizando  y el valor de "security.SAFE.keystore.password" con el password de dicho cacerts (El valor por defecto es: "changeit").

   .. code::

     ....
     <profiles>
    	 <profile>
      	 <id>dev</id>
				   .......
					 <!-- Propiedades SAFE -->
        	 <application.id/>
					 <security.SAFE.active>true</security.SAFE.active>
        	 <security.SAFE.mapRoles>true</security.SAFE.mapRoles>
        	 <security.SAFE.autorizacion.poraplicacion>false</security.SAFE.autorizacion.poraplicacion>
        	 <security.SAFE.environment>DESA</security.SAFE.environment>
        	 <security.SAFE.keystore.file>/home/USER/software/java/jdk1.6.0_45/jre/lib/security/cacerts</security.SAFE.keystore.file>
        	 <security.SAFE.keystore.type.keystore>JKS</security.SAFE.keystore.type.keystore>
        	 <security.SAFE.keystore.alias>geoticdescert</security.SAFE.keystore.alias>
        	 <security.SAFE.keystore.password>changeit</security.SAFE.keystore.password>
        	 <security.SAFE.alias.password>43598</security.SAFE.alias.password>
        	 <security.SAFE.propertiesPath>safe_client_sign.properties</security.SAFE.propertiesPath>
        	 <wsdl.SAFE.location>https://preinterint.gva.es/eSirca_Bus/ins/Proxy/SAFE/AutenticacionArangi_v1_00?wsdl</wsdl.SAFE.location>
        	 <wsdl.SAFEAutorizacion.location>https://preinterint.gva.es:443/eSirca_Bus/ins/Proxy/SAFE/AutorizacionHDFI_v1_00?wsdl</wsdl.SAFEAutorizacion.location>
      	 </properties>
    	 </profile>
		 ....

#. Si obtienes el siguiente error:

   .. code::

      javax.wsdl.WSDLException: WSDLException: faultCode=PARSER_ERROR: Problem parsing 'https://preinterint.gva.es:443/eSirca_Bus/ins/Proxy/SAFE/AutenticacionArangi_v1_00?wsdl'.: javax.net.ssl.SSLHandshakeException: sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target


   añade el siguiente parámetro en JBoss desde "Open launch configuration"-> Pestaña Arguments -> VM arguments:

  .. code::

     -Djavax.net.ssl.trustStore=/home/USER/software/java/jdk1.6.0_45/jre/lib/security/cacerts

  Debes reemplazar por la ruta correcta.


Ejecutar la aplicación
======================

La aplicación será accesible desde http://localhost:8080/gvgeoportal

Fichero de log
==============

En el entorno de desarrollo el log se escribe directamente en el shell.

Todos los comandos que se ejecutan en gvNIX se almacenan en el fichero ``log.roo``.

Empaquetado
===========

Para realizar el enpaquetado de la aplicación se realiza ejecutando el siguiente comando

  mvn clean package -P environment

El parámetro ``environment`` puede ser uno de los siguientes valores:

* dev: desarrollo
* ci: integración continua.
* pre: preproducción.
* pro: producción.

Para los entornos de *pre* y *pro* , la contraseña para conectar con BBDD debe ser facilitada como se muestra a continuación(por ejemplo, para almacenar en *pre*)::

  mvn clean package -P pre -Ddatabase.password=yourpassword

Si se desea saltar los tests añadir el parámetro::

  -DskipTests

Despliegue
==========

En desarrollo el despliegue se realiza de forma automática por la configuración del servidor en el Eclipse.

Para el resto de entornos son los departamentos de Calidad y Sistemas de la GVA los encargados del mismo.