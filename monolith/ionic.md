# Tutoriel sur les microservices avec JHipster :: Démarrage avec un monolithe

## Génération de l'application Ionic (optionnel)

Installez Ionic et le sous-générateur pour Ionic [Plus d'information](https://github.com/oktadeveloper/generator-jhipster-ionic).

```bash
npm install -g ionic
npm install -g generator-jhipster-ionic
```

```bash
yo jhipster-ionic
```
```
Welcome to the Ionic Module for JHipster! v3.2.0

? What do you want to name your Ionic application? store-ion
? Enter the directory where your JHipster app is located: online-store

Creating Ionic app with command: ionic start store-ion oktadeveloper/jhipster
✔ Preparing directory ./store-ion - done!
✔ Looking up starter - done!
✔ Downloading and extracting oktadeveloper/jhipster starter - done!
? Integrate your new app with Cordova to target native iOS and Android? Yes
> ionic integrations enable cordova --quiet
✔ Downloading integration cordova - done!
✔ Copying integrations files to project - done!
[OK] Integration cordova added!
```

Ajoutez les cartes pour les entités `ProductCategory` et `Product`.
```bash
cd store-ion
yo jhipster-ionic:entity ProductCategory
yo jhipster-ionic:entity Product
```

Lancez l'application dans un navigateur
```bash
ionic serve
```
