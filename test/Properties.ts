import { expect } from "chai";
import hre from "hardhat";

describe("RealEstateRegistry", function () {
    let realEstateRegistry: any;
    let owner: any, otherAccount: any;

    before(async function () {
        const RealEstateRegistry = await hre.ethers.getContractFactory("RealEstateRegistry");
        realEstateRegistry = await RealEstateRegistry.deploy();

        [owner, otherAccount] = await hre.ethers.getSigners();
    });

    describe("registerProperty", function () {
        it("Should register a property and assign it to the owner", async function () {
            await realEstateRegistry.registerProperty(
                "40.712776",
                "-74.005974",
                "12345678900",
                "1000000",
                "2",
                "1",
                "3"
            );

            const ownerProperties = await realEstateRegistry.getPropertiesByOwner(owner.address);
            expect(ownerProperties.length).to.equal(1);
        });
    });

    describe("getPropertiesByOwner", function () {
        it("Should return all properties of a specific owner", async function () {
            const propertiesBefore = await realEstateRegistry.getPropertiesByOwner(owner.address);
            await realEstateRegistry.registerProperty(
                "34.052235",
                "-118.243683",
                "09876543211",
                "2000000",
                "3",
                "2",
                "4"
            );
            const propertiesAfter = await realEstateRegistry.getPropertiesByOwner(owner.address);
            expect(propertiesAfter.length).to.equal(propertiesBefore.length + 1);
        });
    });

    describe("getPropertyDetails", function () {
        it("Should return the details of a property by its ID", async function () {
            // Assuming the property with ID 1 exists from the previous test
            const propertyDetails = await realEstateRegistry.getPropertyDetails("1");
            expect(propertyDetails.latitude).to.equal("40.712776");
            expect(propertyDetails.longitude).to.equal("-74.005974");
        });
    });

    // Assuming there's a function to get all properties registered in the last month
    describe("getPropertiesLastMonth", function () {
        it("Should return all properties registered in the last month", async function () {
            // Register a new property to ensure there's at least one
            await realEstateRegistry.registerProperty(
                "51.507351",
                "-0.127758",
                "11223344556",
                "3000000",
                "2",
                "2",
                "5"
            );

            const recentProperties = await realEstateRegistry.getPropertiesLastMonth();
            expect(recentProperties.length).to.be.at.least(1);
        });
    });

    // Add more tests as needed for other functions
});
