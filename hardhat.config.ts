import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    scroll: {
      url: "https://rpc.ankr.com/scroll_sepolia_testnet" || "",
      accounts: [`0x5cd149620d888382ff9d7f2c6888118c7ffc02c849ca5c9376aacf047f0657a0`] // Substitua pelo sua chave privada
    }
  }
};

export default config;