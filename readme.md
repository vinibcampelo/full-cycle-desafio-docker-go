
# Desafio docker image

Este desafio proposto pelo curso da full cycle consiste em construir uma imagem docker com uma aplicação go que tenha o tamanho da imagem após buildar menor que 2MB.

---
## Descrição da solução
Para resolver este desafio tive que utilizar as seguintes técnicas:

 * Utilizada a versão alpine da golang para construirmos a primeira imagem, esta versão é mais leve do que a versão completa
* Utilizamos o GOOS para buildar a aplicação go expecificando a plataforma linux para compilação com as flags -s -w, dessa forma o binário fica mais enxuto e mais leve. [Artigo que explica melhor este funcionamento.](https://opensource.com/article/22/4/go-build-options)
* Por último utilizamos o multistage building para reduzirmos ainda mais o tamanho da nossa imagem, dessa forma após o primeiro build que realizamos para a construção da nossa aplicação go fizemos uma cópia para uma imagem ainda menor chamada [scratch](https://hub.docker.com/_/scratch).

com isso obtivemos uma imagem final de 1.39 megas contra 301MB sem utilizar o multistage building.

---

Para rodar o docker file utilize os seguintes comandos: 
&nbsp;

Para buildar:
>docker build -t desafio-go . -f Dockerfile

&nbsp;

Após buildar a imagem use o seguinte comando para rodar a aplicação:

>docker run --name desafio-go -v $(pwd):/src desafio-go:latest
---