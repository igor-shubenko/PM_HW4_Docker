## Image build

1. Clone project
2. To build an image run command from directory with dockerfile.

```
docker build -t <image_name:image_tag> .
```

3. To run image in a container run

```
docker run -d -p <free_port_number>:8080 <image_name:image_tag> -t <container_name>
```

## Опис програми усередині контейнера

Всередині контейнера запускається webserver airflow. Логін і пароль для входу - **airflow**


