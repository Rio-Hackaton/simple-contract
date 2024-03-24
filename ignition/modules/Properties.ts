import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const RealEstateRegistryModule = buildModule("RealEstateRegistryModule", (m) => {
  const realEstateRegistry = m.contract("RealEstateRegistry");

  return { realEstateRegistry };
});

export default RealEstateRegistryModule;
