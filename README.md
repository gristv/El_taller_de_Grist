El_taller_de_Grist
=========

Vamos a utilizar este repositorio para practicar con Github subiendo los proyectos con los que estamos trabajando.

Para inciarme en Git / Github he seguido el siguiente <a href="http://www.youtube.com/watch?v=nN9NQRSG7iU&list=PL-RTXOrSoE6RP5wLjn81xFhKAzwThmr1m">podcast</a> y el <a href="http://git-scm.com/book/es-ni">manual</a> al que hacen referencia en el video.

Dejo constancia de los comandos que permiten subir un repositorio local a Github:</br>
</br>
touch README.md #Opcional</br>
git init #Incializamos el repositorio (carpeta local) que queremos mantener bajo control de versiones.</br>
git add README.md #Añadimos los archivos del repositorio que queramos mantener bajo control de versiones.</br>
git commit -m "first commit" #Hacemos commit.</br>
git remote add origin git@github.com:gristv/El_taller_de_Grist.git #Añadimos como origen el repsoitorio que priviamente hemos creado en Github.</br>
git push -u origin master #Subimos los archivos del repositoio local (master) al repositorio Github (origin).</br>
