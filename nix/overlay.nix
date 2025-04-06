final: prev: {
  nvbench = final.callPackage ./nvbench.nix {
    cudaPackages = final.cudaPackages_12_8;
  };
}
