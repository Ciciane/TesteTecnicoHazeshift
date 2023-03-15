# TesteTecnicoHazeshift

Passo a passo para rodar o projeto:


1 Clone o repositório na pasta de sua preferencia. 


2 Abra no Visual Studio Code a pasta TesteTecnicoHazeShit


3 Reescreva o conteúdo de launch.json que está na pasta .vscode com o launch que estará abaixo.


4 Aceite o add "pub get". 


5 Feche o projeto e abra novamente.


6 Compile.


obs: caso não apareça nenhuma opção de instalar o pub get, vá até o terminal do VsCode e digite o comando "flutter pub get".



launch.Json

{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "teste_hazeshift",
            "cwd": "teste_hazeshift",
            "request": "launch",
            "type": "dart",
            "program": "lib/HomeTasks/View/homeList.dart",
        },
        {
            "name": "teste_hazeshift (profile mode)",
            "cwd": "teste_hazeshift",
            "request": "launch",
            "type": "dart",
            "flutterMode": "profile"
        },
        {
            "name": "teste_hazeshift (release mode)",
            "cwd": "teste_hazeshift",
            "request": "launch",
            "type": "dart",
            "flutterMode": "release"
        }
    ]
}
