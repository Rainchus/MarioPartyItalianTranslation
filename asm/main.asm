.n64 // Let armips know we're coding for the N64 architecture
.open "rom/mp1.pal.z64", "rom/mp1.pal.mod.z64", 0 // Open the ROM file
.include "asm/bootPatch.asm"
.close // Close the ROM file