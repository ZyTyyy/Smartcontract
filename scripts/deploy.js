const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contract with the account:", deployer.address);

    // Paramètres de la loterie : nombre maximum de participants, prix du ticket et durée en secondes
    const Lottery = await ethers.getContractFactory("SimpleLotto");
    const maxParticipants = 10000; // nombre maximum de participants souhaité
    const ticketPrice = ethers.utils.parseEther("0.0001"); // prix du ticket en ETH
    const duration = 30 * 24 * 60 * 60; // durée de la loterie en secondes (30 jours)

    // Déploiement du contrat avec les paramètres
    const lottery = await Lottery.deploy(maxParticipants, ticketPrice, duration);

    console.log("Lottery contract deployed at:", lottery.address);
}

main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error("Error during deployment:", error);
        process.exit(1);
    });
