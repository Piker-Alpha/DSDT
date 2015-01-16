/*
 * Disassembly of DSDT-GA-Z87M-D3H-stripped.aml
 */

DefinitionBlock ("DSDT.aml", "DSDT", 2, "Apple", "iMac", 0x00070001)
{
    OperationRegion (GNVS, SystemMemory, 0xDB742C18, 0x7D)
    Field (GNVS, AnyAcc, Lock, Preserve)
    {
        Offset (0x7B), 
        ECON,   8,     // Embedded Controller Availability Flag.
        GPIC,   8      // Global IOAPIC/8259 Interrupt Mode Flag.
    }

    OperationRegion (PMIO, SystemIO, 0x1800, 0x80)
    Field (PMIO, ByteAcc, NoLock, Preserve)
    {
        Offset (0x42), 
            ,   1, 
        GPEC,   1
    }

    Scope (_PR)
    {
        // You may have/need 8 for your processor!
        Processor (CPU0, 0x01, 0x00000410, 0x06) {}
        Processor (CPU1, 0x02, 0x00000410, 0x06) {}
        Processor (CPU2, 0x03, 0x00000410, 0x06) {}
        Processor (CPU3, 0x04, 0x00000410, 0x06) {}
        /* You may need 4 more for your processor!
        Processor (CPU4, 0x05, 0x00001810, 0x06) {}
        Processor (CPU5, 0x06, 0x00001810, 0x06) {}
        Processor (CPU6, 0x07, 0x00001810, 0x06) {}
        Processor (CPU7, 0x08, 0x00001810, 0x06) {} */
    }

    Scope (_SB)
    {
        Device (MEM2) // Optionally, required when the IGPU is enabled in the BIOS
        {
            Name (_HID, EisaId ("PNP0C01"))
            Name (_UID, 0x02)
            Name (_STA, 0x0F)
            Name (_CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x20000000, 0x00200000, )
                Memory32Fixed (ReadWrite, 0x40000000, 0x00200000, )
            })
        }

        Device (PCI0)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_BBN, Zero)
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_PRT, Package (0x1A)  // _PRT: PCI Routing Table (AR00)
            {
                Package (0x04) { 0x001FFFFF, Zero, Zero, 0x15 }, 
                Package (0x04) { 0x001FFFFF,  One, Zero, 0x13 }, 
                Package (0x04) { 0x001FFFFF, 0x02, Zero, 0x12 }, 
                Package (0x04) { 0x001FFFFF, 0x03, Zero, 0x10 },
                Package (0x04) { 0x0014FFFF, Zero, Zero, 0x10 }, // XHC1
                Package (0x04) { 0x001DFFFF, Zero, Zero, 0x17 }, // EHC1
                Package (0x04) { 0x001AFFFF, Zero, Zero, 0x10 }, // EHC2
                Package (0x04) { 0x001BFFFF, Zero, Zero, 0x16 }, // HDEF
                Package (0x04) { 0x0016FFFF, Zero, Zero, 0x10 },
                Package (0x04) { 0x0016FFFF,  One, Zero, 0x13 }, 
                Package (0x04) { 0x0016FFFF, 0x02, Zero, 0x12 }, 
                Package (0x04) { 0x0016FFFF, 0x03, Zero, 0x11 }, 
                Package (0x04) { 0x001CFFFF, Zero, Zero, 0x10 }, // RP0n
                Package (0x04) { 0x001CFFFF,  One, Zero, 0x11 }, // RP0n 
                Package (0x04) { 0x001CFFFF, 0x02, Zero, 0x12 }, // RP0n
                Package (0x04) { 0x001CFFFF, 0x03, Zero, 0x13 }, // RP0n
                Package (0x04) { 0x0001FFFF, Zero, Zero, 0x10 }, // PEG0
                Package (0x04) { 0x0001FFFF,  One, Zero, 0x11 }, // PEG0 
                Package (0x04) { 0x0001FFFF, 0x02, Zero, 0x12 }, // PEG0
                Package (0x04) { 0x0001FFFF, 0x03, Zero, 0x13 }, // PEG0
                Package (0x04) { 0x0002FFFF, Zero, Zero, 0x10 }, // IGPU 
                Package (0x04) { 0x0003FFFF, Zero, Zero, 0x10 }, // HDAU
                Package (0x04) { 0x0004FFFF, Zero, Zero, 0x10 }, 
                Package (0x04) { 0x0004FFFF,  One, Zero, 0x11 }, 
                Package (0x04) { 0x0004FFFF, 0x02, Zero, 0x12 }, 
                Package (0x04) { 0x0004FFFF, 0x03, Zero, 0x13 }
            })
            Name (_CRS, ResourceTemplate ()
            {
                IO (Decode16, 0x0CF8, 0x0CF8, 0x01, 0x08, )
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode, 0x0000, 0x0000, 0x003E, 0x0000, 0x003F,,, )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange, 0x00000000, 0x00000000, 0x00000CF7, 0x00000000, 0x00000CF8,,,, TypeStatic)
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange, 0x00000000, 0x00000D00, 0x0000FFFF, 0x00000000, 0x0000F300,,,, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000A0000, 0x000BFFFF, 0x00000000, 0x00020000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000C0000, 0x000C3FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000C4000, 0x000C7FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000C8000, 0x000CBFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000CC000, 0x000CFFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000D0000, 0x000D3FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000D4000, 0x000D7FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000D8000, 0x000DBFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000DC000, 0x000DFFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000E0000, 0x000E3FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0x000E4000, 0x000E7FFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000E8000, 0x000EBFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000EC000, 0x000EFFFF, 0x00000000, 0x00004000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,  0x00000000, 0x000F0000, 0x000FFFFF, 0x00000000, 0x00010000,,,, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite, 0x00000000, 0xBFA00000, 0xFEAFFFFF, 0x00000000, 0x3F100000,,,, AddressRangeMemory, TypeStatic)
            })

            Device (PDRC)
            {
                Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
                Name (_CRS, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite, 0xFED1C000, 0x00004000, )
                    Memory32Fixed (ReadWrite, 0xFED10000, 0x00008000, )
                    Memory32Fixed (ReadWrite, 0xFED18000, 0x00001000, )
                    Memory32Fixed (ReadWrite, 0xFED19000, 0x00001000, )
                    Memory32Fixed (ReadWrite, 0xF8000000, 0x40000000, )
                    Memory32Fixed (ReadWrite, 0xFED20000, 0x00020000, )
                    Memory32Fixed (ReadOnly,  0xFED90000, 0x00004000, )
                    Memory32Fixed (ReadWrite, 0xFED45000, 0x0004B000, )
                    Memory32Fixed (ReadOnly,  0xFF000000, 0x01000000, )
                    Memory32Fixed (ReadOnly,  0xFEE00000, 0x00100000, )
                    Memory32Fixed (ReadWrite, 0xF7FDF000, 0x00001000, )
                    Memory32Fixed (ReadWrite, 0xF7FE0000, 0x00010000, )
                })
            }

            Device (MCHC)
            {
                Name (_ADR, Zero)
            }

            Device (IGPU)
            {
                Name (_ADR, 0x00020000)
            }


            Device (PEG0) // Can be removed/renamed to P0P2 if SSDT tables are dropped
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D,
                    0x04
                })
                Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x10 },
                    Package (0x04) { 0xFFFF,  One, Zero, 0x11 },
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x12 },
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x13 }
                })

                /* Device (GFX0) // Optional, for GPU card.
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x09,
                        0x04
                    })
                }

                Device (HDAU) // Optional, Audio for GPU card.
                {
                    Name (_ADR, One)  // _ADR: Address
                }
            }

            Device (HDAU)
            {
                Name (_ADR, 0x00030000)  // _ADR: Address
                Name (_STA, 0x0F)  // _STA: Status

                OperationRegion (HDAH, PCI_Config, 0x54, One)
                Field (HDAH, ByteAcc, NoLock, Preserve)
                {
                        ,   5,
                    AUDE,   1
                }

                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Store (One, AUDE)
                    Notify (PCI0, Zero)
                }
			
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                            0x03
                        })
                    }

                    Return (Package (0x02)
                    {
                        "hda-gfx",
                        Buffer (0x0A)
                        {
                            "onboard-1"
                        }
                    })
                }
            }

            Device (XHC1)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                   0x0D, 
                   0x04
                })

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                            0x03
                        })
                    }

                    Return (Package (0x09)
                    {
                        "AAPL,current-available", 
                        0x0834, 
                        "AAPL,current-extra", 
                        0x0A8C, 
                        "AAPL,current-extra-in-sleep", 
                        0x0A8C, 
                        "AAPL,max-port-current-in-sleep", 
                        0x0834, 
                        Buffer (One)
                        {
                             0x00
                        }
                    })
                }

                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (HECI)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                   0x0D, 
                   0x04
                })
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16, 0x0000, 0x0000, 0x01, 0x20, )
                        IO (Decode16, 0x0081, 0x0081, 0x01, 0x11, )
                        IO (Decode16, 0x0093, 0x0093, 0x01, 0x0D, )
                        IO (Decode16, 0x00C0, 0x00C0, 0x01, 0x20, )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09"))  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (Zero)
                    }

                    Name (CMDR, Zero)

                    Method (ECRD, 1, Serialized)
                    {
                        Return (DerefOf (Arg0))
                    }

                    Method (ECWT, 2, Serialized)
                    {
                        Store (Arg0, Arg1)
                    }

                    Method (ECMD, 1, Serialized)
                    {
                        If (ECON)
                        {
                            While (CMDR)
                            {
                                Stall (0x14)
                            }

                            Store (Arg0, CMDR)
                        }
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
                    Name (_UID, Zero)  // _UID: Unique ID
                    Name (_STA, 0x0F)
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        Memory32Fixed (ReadWrite, 0xFED00000, 0x00000400 )
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16, 0x0020, 0x0020, 0x01, 0x02, )
                        IO (Decode16, 0x0024, 0x0024, 0x01, 0x02, )
                        IO (Decode16, 0x0028, 0x0028, 0x01, 0x02, )
                        IO (Decode16, 0x002C, 0x002C, 0x01, 0x02, )
                        IO (Decode16, 0x0030, 0x0030, 0x01, 0x02, )
                        IO (Decode16, 0x0034, 0x0034, 0x01, 0x02, )
                        IO (Decode16, 0x0038, 0x0038, 0x01, 0x02, )
                        IO (Decode16, 0x003C, 0x003C, 0x01, 0x02, )
                        IO (Decode16, 0x00A0, 0x00A0, 0x01, 0x02, )
                        IO (Decode16, 0x00A4, 0x00A4, 0x01, 0x02, )
                        IO (Decode16, 0x00A8, 0x00A8, 0x01, 0x02, )
                        IO (Decode16, 0x00AC, 0x00AC, 0x01, 0x02, )
                        IO (Decode16, 0x00B0, 0x00B0, 0x01, 0x02, )
                        IO (Decode16, 0x00B4, 0x00B4, 0x01, 0x02, )
                        IO (Decode16, 0x00B8, 0x00B8, 0x01, 0x02, )
                        IO (Decode16, 0x00BC, 0x00BC, 0x01, 0x02, )
                        IO (Decode16, 0x04D0, 0x04D0, 0x01, 0x02, )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16, 0x00F0, 0x00F0, 0x01, 0x01, )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x002E, 0x002E, 0x01, 0x02, )
                        IO (Decode16, 0x004E, 0x004E, 0x01, 0x02, )
                        IO (Decode16, 0x0061, 0x0061, 0x01, 0x01, )
                        IO (Decode16, 0x0063, 0x0063, 0x01, 0x01, )
                        IO (Decode16, 0x0065, 0x0065, 0x01, 0x01, )
                        IO (Decode16, 0x0067, 0x0067, 0x01, 0x01, )
                        IO (Decode16, 0x0070, 0x0070, 0x01, 0x01, )
                        IO (Decode16, 0x0080, 0x0080, 0x01, 0x01, )
                        IO (Decode16, 0x0092, 0x0092, 0x01, 0x01, )
                        IO (Decode16, 0x00B2, 0x00B2, 0x01, 0x02, )
                        IO (Decode16, 0x0680, 0x0680, 0x01, 0x20, )
                        IO (Decode16, 0xFFFF, 0xFFFF, 0x01, 0x01, )
                        IO (Decode16, 0xFFFF, 0xFFFF, 0x01, 0x01, )
                        IO (Decode16, 0xFFFF, 0xFFFF, 0x01, 0x01, )
                        IO (Decode16, 0x1C00, 0x1C00, 0x01, 0xFF, ) // Name (GPBS, 0x1C00)
                        IO (Decode16, 0x1D00, 0x1D00, 0x01, 0xFF, ) // GPBS + 0x100 = 0x1D00
                        IO (Decode16, 0x1E00, 0x1E00, 0x01, 0xFF, ) // GPBS + 0x200 = 0x1E00
                        IO (Decode16, 0x1F00, 0x1F00, 0x01, 0xFF, ) // GPBS + 0x300 = 0x1F00
                        IO (Decode16, 0x1800, 0x1800, 0x01, 0xFF, )
                        IO (Decode16, 0x164E, 0x164E, 0x01, 0x02, )
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16, 0x0070, 0x0070, 0x01, 0x08, )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16, 0x0040, 0x0040, 0x01, 0x04, )
                        IO (Decode16, 0x0050, 0x0050, 0x10, 0x04, )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x10)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16, 0x0010, 0x0010, 0x00, 0x10, )
                        IO (Decode16, 0x0022, 0x0022, 0x00, 0x1E, )
                        IO (Decode16, 0x0044, 0x0044, 0x00, 0x1C, )
                        IO (Decode16, 0x0062, 0x0062, 0x00, 0x02, )
                        IO (Decode16, 0x0065, 0x0065, 0x00, 0x0B, )
                        IO (Decode16, 0x0072, 0x0072, 0x00, 0x0E, )
                        IO (Decode16, 0x0080, 0x0080, 0x00, 0x01, )
                        IO (Decode16, 0x0084, 0x0084, 0x00, 0x03, )
                        IO (Decode16, 0x0088, 0x0088, 0x00, 0x01, )
                        IO (Decode16, 0x008C, 0x008C, 0x00, 0x03, )
                        IO (Decode16, 0x0090, 0x0090, 0x00, 0x10, )
                        IO (Decode16, 0x00A2, 0x00A2, 0x00, 0x1E, )
                        IO (Decode16, 0x00E0, 0x00E0, 0x00, 0x10, )
                        IO (Decode16, 0x04D0, 0x04D0, 0x00, 0x02, )
                    })
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                Device (BUS0)
                {
                    Name (_CID, "smbus")  // _CID: Compatible ID
                    Name (_ADR, Zero)  // _ADR: Address
                }
                Device (BUS1)
                {
                    Name (_CID, "smbus")  // _CID: Compatible ID
                    Name (_ADR, One)  // _ADR: Address
                }
            }

            Device (RP01) // May not be enabled on other motherboards 
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table (AR04)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x10 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x11 },
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x12 },
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x13 }
                })
            }

            Device (RP02) // May not be enabled on other motherboards
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table (AR05)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x11 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x12 },
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x13 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x10 }
                })
            }

            Device (RP03) // May not be enabled on other motherboards
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table (AR06)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x12 },
                    Package (0x04) { 0xFFFF,  One, Zero, 0x13 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x10 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x11 }
                })

                Device (GIGE) // Can be in another spot on other motherboards
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x09, 
                        0x04
                    })
                }
            }

            Device (RP04) // May not be enabled on other motherboards
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table (AR07)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x13 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x10 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x11 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x12 }
                })
            }

            Device (RP05) // May not be enabled on other motherboards
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table (AR08)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x10 },
                    Package (0x04) { 0xFFFF,  One, Zero, 0x11 },
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x12 },
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x13 }
                })

                Device (ARPT) // Optional PCIe card with BCM4360 WiFi/Bluetooth module
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x09, 
                        0x04
                    })
                }
            }
        }

        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))  // _HID: Hardware ID
            Name (_UID, 0xAA)  // _UID: Unique ID
            Name (_STA, 0x0B)  // _STA: Status
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x1D, 
                0x03
            })
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))  // _HID: Hardware ID
            Name (_STA, 0x0B)  // _STA: Status
        }
    }

    Scope (\_GPE)
    {
        Method (_L1D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
             Notify (\_SB.PWRB, 0x02)
        }

        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.RP01, 0x02)
            Notify (\_SB.PCI0.RP02, 0x02)
            Notify (\_SB.PCI0.RP03, 0x02)
            Notify (\_SB.PCI0.RP04, 0x02)
            Notify (\_SB.PCI0.RP05, 0x02)
            /* Optional PEG0/P0P2 notification
            Notify (\_SB.PCI0.PEG0, 0x02)
            Notify (\_SB.PCI0.P0P2, 0x02) */
            Notify (\_SB.PCI0.RP03.GIGE, 0x02)
            Notify (\_SB.PCI0.RP05.ARPT, 0x02)
        }

        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            /* Notify (\_SB.PCI0.EHC1, 0x02)
            Notify (\_SB.PCI0.EHC2, 0x02) */
            Notify (\_SB.PCI0.XHC1, 0x02)
            Notify (\_SB.PCI0.HDEF, 0x02)
        }

        /* Method (_L01, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Add (L01C, One, L01C)
            P8XH (Zero, One)
            P8XH (One, L01C)
        } */

        Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (Zero, GPEC)
        }

        /* Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
        }

        Method (_L07, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
        } */
    }

    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, GPIC)
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
    }

    Method (_WAK, 1, Serialized)  // _WAK: Wake
    {
        Return (Package (0x02)
        {
            Zero, 
            Zero
        })
    }

    Name (_S0, Package (0x04) { Zero, Zero, Zero, Zero })
    Name (_S3, Package (0x04) { 0x05, Zero, Zero, Zero })
    Name (_S4, Package (0x04) { 0x06, Zero, Zero, Zero })
    Name (_S5, Package (0x04) { 0x07, Zero, Zero, Zero })
}

