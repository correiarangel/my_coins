Beleza! Vou converter e refatorar todo o seu texto, deixando em **Markdown puro**, mais limpo, bem formatado e apresentável, sem HTML quebrado. Aqui está a nova versão:

---

# 👋 Olá, seja bem-vindo!

[![LinkedIn](https://raw.githubusercontent.com/peterthehan/peterthehan/master/assets/linkedin.svg) LinkedIn Always On](https://www.linkedin.com/in/marcos-fabiano-correia-rangel/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/correiarangel)

[![Codecov](https://codecov.io/gh/correiarangel/my_coins/branch/main/graph/badge.svg?token=FEIP7KTH3N)](https://codecov.io/gh/correiarangel/my_coins)

[**▶️ Google Play**](https://play.google.com/store/apps/details?id=br.com.rangeldev.mycoins)

[**📺 YouTube**](https://www.youtube.com/watch?v=PqIcWPnEfyE)

---

# 📱 My Coins

> Consulta simples de cotações de câmbio, como dólares, euros e criptomoedas.

Aplicativo desenvolvido em **Flutter** utilizando conceitos de **Clean Architecture** e **Testes Unitários**.

O app consome dados de uma API simples e exibe as informações em uma **ListView customizada**.

---

## 🚀 Começando

Este projeto é um ponto de partida para um aplicativo Flutter.

Alguns recursos úteis para começar, se este for seu primeiro projeto Flutter:

- [Lab: Escreva seu primeiro app Flutter](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Exemplos úteis de Flutter](https://flutter.dev/docs/cookbook)

Para mais ajuda, acesse a [documentação online do Flutter](https://flutter.dev/docs), que oferece tutoriais, exemplos e uma referência completa da API.

---

## 🧩 Modular

- [Flutter Modular (GitHub)](https://github.com/Flutterando/modular)

### 📚 Documentação

- [flutter_modular Documentation](https://github.com/Flutterando/modular/tree/master/flutter_modular)
- [flutter_modular_test Documentation](https://github.com/Flutterando/modular/tree/master/flutter_modular_test)

---

## 🌐 API utilizada

- [AwesomeAPI - Documentação](https://docs.awesomeapi.com.br/)

---



### Run Project Android/iOS

- flutter run 
- flutter run lib/main.dart 

### Run Build appbundle Android

- flutter build appbundle --obfuscate --split-debug-info \app -t lib/main.dart

### Run Build apk Android

- flutter build apk --obfuscate --split-debug-info \app -t lib/main.dart

# Run the package Android/iOS

After setting up the configuration, all that is left to do is run the package.

- flutter pub get
- flutter pub run flutter_launcher_icons

### After adding your settings, run the following command in the terminal  Android/iOS:

- dart run flutter_native_splash:create

### When the package finishes running, your splash screen is ready Android/iOS.

To specify the YAML file location just add --path with the command in the terminal:

- dart run flutter_native_splash:create --path=path/to/my/file.yaml

### flutter_flavorizr Android/iOS

- flutter pub run flutter_flavorizr
