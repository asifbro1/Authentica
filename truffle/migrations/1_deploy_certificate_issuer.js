const CertificateIssuer = artifacts.require("CertificateIssuer");

module.exports = function (deployer) {
  deployer.deploy(CertificateIssuer);
};
