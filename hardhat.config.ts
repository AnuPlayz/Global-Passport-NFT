import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.19",
  defaultNetwork: "ropsten",
     networks: {
        hardhat: {},
        ropsten: { 
            url: "https://polygon-mumbai.g.alchemy.com/v2/GonrEGE3n5YZfD0PiTI72k14Zm3Upbmn",
            accounts: ["0xb05e927a8fc9c620bbacca32bcc5cf074c76e2eeefae3e11cf456d417baa5fbb"],
           },
       },
};

export default config;
