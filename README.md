# dockerparte2
paso 0: con CP copiamos y pegamos el proyecto desde la carpeta original a la carpeta priceservice-mysql de source.

paso 1 priceservice-mysql. modificación para correcto funcionamiento de mysql
tenemos que añadir el codigo que vemos dentro de la carpeta que he compartido en pom.xml para que su funcionamiento transcurra de forma correcta.

paso 2 archivo application.yml compilación
este archivo lo modificamos para que se conecte a los servicios del proyecto lo podemos encontrar en la carpeta de nuestro proyecto /source/src/main. no confuncir con / de la raiz de nuestra maquina, ahí no vamos a encontrar estas carpetas, debe de ser dentro de nuestros proyectos.

paso 3 creamos el dockfile
la compilación se haría con el código docker run -it --rm --network host --name priceservice-maven -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven:3.8.1-openjdk-11 mvn clean install -Dmaven.test.skip=true desde la carpeta de nuestro proyecto
