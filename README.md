[cheveretourl]: https://chevereto.com/
[cheveretogithub]: https://github.com/Chevereto/Chevereto-Free
[createdbscript]: https://raw.githubusercontent.com/hannah98/chevereto-docker/master/create_database.sh
                  

[![chevereto](http://chevereto.com/app/themes/v3/img/chevereto-blue.svg)][cheveretourl]

# furiousgeorge/chevereto

[Chevereto][cheveretourl] is a powerful and fast image hosting script that allows you to create your very own full featured image hosting website in just minutes.

This docker image was created from the [Chevereto-Free github repository][cheveretogithub]. 

## Example Usage

```
docker run -it --name chevereto -d --link mysql:mysql -p 80:80 -v "$PWD/chevereto":/var/www/html furiousgeorge/chevereto
```

### Parameter explanation

* ```--name``` - a name for your container.
* ```-d``` - detach (run in the background).
* ```--link``` - link a running MySQL container to this container.  The left side of the colon is the name of the running MySQL container.  The right side of the colon is the hostname alias that this Chevereto container will see.
* ```-p``` - The port mapping.  The left side of the colon is the port that will be open on your host.  The right side of the colon should stay set as 80 since apache is listening on port 80 inside this container.
* ```-v``` - The volume mapping.  The left side of the colon is the location on your local host.  The right side of the colon should stay set at /var/www/html
 
Once the container is started, it will download a Chevereto installer webpage.  Browse to http://localhost:YOURPORT (where YOURPORT is the port you chose in the ```-p``` argument above) and the installer script will install the application and guide you through the setup.

## Database helper script

A helper script ([create_database.sh][createdbscript]) has been included to assist with creating the database for the Chevereto application.  Follow the instructions in the script and run it on your docker host.

## Other Notes

### Maximum upload size

The default maximum image upload size is 2MB.  If you would like to increase the maximum size, follow these instructions (**After** the Chevereto application is installed and running):

#### Step 1 - php setting

* On your docker host, find the ```.htaccess``` file (for the run example above, ```$PWD/chevereto/.htaccess```)
* Edit the ```.htaccess``` file and add the following line somewhere after the ```Options```
*  ```php_value upload_max_filesize 90M```
*  This would increase the maximum upload size to 90M - change the value to whatever you feel is appropriate.
The resulting file should look something like this:

```
ServerSignature Off
Options -Indexes
Options -MultiViews
Options +FollowSymLinks

php_value upload_max_filesize 90M

<IfModule mod_rewrite.c>
```

#### Step 2 - Chevereto setting

* In your Chevereto application, browse to your dashboard->Settings and choose the image upload page (URL should be something like ```http://yoursite/dashboard/settings/image-upload```)
* Scroll down to ```Max. filesize (MB)``` option and adjust the value.

