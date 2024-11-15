# BlockLucky - Loterie décentralisée

Bienvenue dans **BlockLucky**, une application de loterie décentralisée construite avec un smart contract Ethereum. Les participants peuvent acheter des tickets pour avoir une chance de remporter le jackpot. Ce projet inclut un smart contract en Solidity, un frontend en React, et est déployé sur le réseau de test Sepolia.

## Table des matières
- [Aperçu du projet](#aperçu-du-projet)
- [Fonctionnalités](#fonctionnalités)
- [Technologies utilisées](#technologies-utilisées)
- [Configuration et installation](#configuration-et-installation)
- [Utilisation](#utilisation)
- [Structure du projet](#structure-du-projet)
- [Licence](#licence)

## Aperçu du projet
BlockLucky permet aux utilisateurs d'acheter des tickets de loterie pour tenter de remporter un jackpot. Les transactions sont sécurisées et transparentes grâce à l'utilisation de la blockchain Ethereum.

## Fonctionnalités
- **Achat de tickets** : Les utilisateurs peuvent acheter des tickets de loterie pour participer au tirage.
- **Décentralisation** : Le tirage au sort est réalisé par un smart contract, garantissant transparence et équité.
- **Interface utilisateur** : Une interface en React permettant aux utilisateurs de visualiser le jackpot actuel, le prochain tirage, et de participer à la loterie.

## Technologies utilisées
- **Solidity** : Langage pour le smart contract.
- **Hardhat** : Framework de développement pour tester et déployer des smart contracts Ethereum.
- **React** : Framework JavaScript pour créer l'interface utilisateur.
- **Ethers.js** : Librairie pour interagir avec la blockchain Ethereum depuis JavaScript.
- **MetaMask** : Extension de navigateur pour gérer les comptes et effectuer des transactions Ethereum.

## Configuration et installation

### Prérequis
- [Node.js](https://nodejs.org/) et npm installés
- [MetaMask](https://metamask.io/) pour interagir avec le réseau Ethereum
- Compte GitHub pour cloner le dépôt

### Étapes d'installation

1. **Cloner le dépôt** :
   ```bash
   git clone https://github.com/ZyTyyy/Smartcontract.git
   cd Smartcontract
   
2. **Installer les dépendances du projet** :
   ```bash
   npm install

3. **Configuration du réseau de test** : Configurez MetaMask pour le réseau de test Sepolia et ajoutez des fonds de test.

   - Ouvrez MetaMask et cliquez sur votre avatar en haut à droite, puis allez dans **Paramètres** > **Réseaux** > **Ajouter un réseau**.
   - Remplissez les informations suivantes pour ajouter le réseau Sepolia :
     - **Nom du réseau** : Sepolia Test Network
     - **Nouvelle URL RPC** : `https://rpc.sepolia.org`
     - **ID de la chaîne** : `11155111`
     - **Symbole** : `SepoliaETH`
     - **Explorateur de blocs** : `https://sepolia.etherscan.io`

   - Après avoir ajouté le réseau, vous pouvez obtenir des SepoliaETH de test en utilisant un faucet Sepolia, par exemple [Sepolia Faucet](https://faucet.sepolia.dev/).

4. **Déployer le smart contract** : Utilisez Hardhat pour déployer le smart contract en local ou sur un réseau de test comme Sepolia.

   ```bash
   npx hardhat run scripts/deploy.js --network sepolia

5. **Démarrer l'app avec le frontend** : Naviguez vers le dossier du frontend et lancez l'application React.

   ```bash
   cd blocklucky-frontend
   npm start

## Utilisation

1. **Acheter un ticket** : Une fois l'application démarrée et MetaMask connecté, cliquez sur le bouton "Acheter des tickets" pour acheter un ticket de loterie. MetaMask vous demandera de confirmer la transaction.

2. **Confirmation de la transaction** : Après validation, vous recevrez un message de confirmation de la transaction dans l'application, indiquant que votre participation a été enregistrée.

3. **Suivi du jackpot** : L'interface de l'application vous permet de visualiser le montant actuel du jackpot ainsi que la date du prochain tirage.

4. **Fin de la loterie** : Une fois la loterie terminée, un gagnant est tiré au sort et les fonds sont automatiquement transférés à son compte.
