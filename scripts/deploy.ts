import { ethers } from "hardhat";

async function main() {
  const AttestationStation = await ethers.deployContract("AttestationStation", [
    "AttestationStation",
    "ATTEST",
  ])
  await AttestationStation.waitForDeployment()

  console.log("AttestationStation deployed to:", await AttestationStation.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
