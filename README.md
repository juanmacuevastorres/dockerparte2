# dockerparte2
En el ultimo día de clases hemos profundizado mucho más en Docker, usando comandos y métodos nuevos para nosotros, la teoría es fácil de aprender aunque en la práctica en ocasiones da fallos, algunos fallos puede ser de modificación de archivos, pero otros fallos pueden ser simplemente por una imagen o una maquina virtual que no es compatible al 100%. 

pequeño tutorial:
Primeramente con CP copiamos y pegamos el proyecto desde la carpeta original a la carpeta priceservice-mysql de source.

Una vez hecho eso tenemos priceservice-mysql. modificación para correcto funcionamiento de mysql
tenemos que añadir el codigo que vemos dentro de la carpeta que he compartido en pom.xml para que su funcionamiento transcurra de forma correcta.

el siguiente paso es la compilacion, para ello necesitamos application.yml 
este archivo lo modificamos para que se conecte a los servicios del proyecto lo podemos encontrar en la carpeta de nuestro proyecto /source/src/main. no confuncir con / de la raiz de nuestra maquina, ahí no vamos a encontrar estas carpetas, debe de ser dentro de nuestros proyectos.

el siguiente paso será crear el dockfile
la compilación se haría con el código docker run -it --rm --network host --name priceservice-maven -v "$(pwd)":/usr/src/mymaven -w /usr/src/mymaven maven:3.8.1-openjdk-11 mvn clean install -Dmaven.test.skip=true desde la carpeta de nuestro proyecto. una vez hecho esto tenemos que poner el código que nos indica el profesor para poder conectar perfectamente el proyecto. (ojo con los puertos.)
openjdk:11
ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS="" \
    SERVER_PORT=9091 \
    APPLICATION=inner-spring-boot-app
EXPOSE ${SERVER_PORT}
ADD *.jar /${APPLICATION}.jar
CMD java ${JAVA_OPTS} -Dserver.port=${SERVER_PORT} -Djava.security.egd=file:/dev/./urandom -jar /${APPLICATION}.jar

seguidamente debemos copiar con cp el jar en /binaries/price-service.mysql
por ultimo compilamos la imagen *captura de pantalla subida* se realiza con docker build -t y el servicio que vayamos a usar, en mi caso he hecho la captura con priceservicemysql

una vez hecho todo eso tenemos que crear el docker-compose, en el interior del archivo encontraremos el código que tenemos que definir para que todo funcione correctamente. iniciarlo con version: "2". de nuevo ojo con los puertos. 

con docker-compose up seguidamente de docker-ps veremos si los pasos que hemos ido realizando se ha hecho correctamente. **ejemplo en imagen compose up ps.png**

