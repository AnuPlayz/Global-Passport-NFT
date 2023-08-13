import { ethers } from "hardhat";

async function main() {
  const AttestationStation = await ethers.deployContract("AttestationStation", [
    "AttestationStation",
    "ATTEST",
  ])
  await AttestationStation.deplo()

  console.log("AttestationStation deployed to:", AttestationStation.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
