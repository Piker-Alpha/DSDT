/*
 * Disassembly of DSDT-GA-Z87MX-D3H-F6-factory.aml
 */

DefinitionBlock ("DSDT-GA-Z87MX-D3H-F6.aml", "DSDT", 2, "APPLE", "Macmini", 0x00070001)
{
    Name (SP1O, 0x2E)
    Name (GPIB, 0x0A00)
    Name (GPIL, 0x10)
    Name (PMEB, 0x0A20)
    Name (PMEL, 0x10)
    Name (HWMB, 0x0A30)
    Name (HWML, 0x10)
    Name (IOES, Zero)
    Name (SMBS, 0x0580)
    Name (SMBL, 0x20)
    Name (PMBS, 0x1800)
    Name (GPBS, 0x1C00)
    Name (SMIP, 0xB2)
    Name (DSSP, Zero)
    Name (FHPP, Zero)
    Name (APCB, 0xFEC00000)
    Name (APCL, 0x1000)
    Name (SMCR, 0x1830)
    Name (HPTB, 0xFED00000)
    Name (HPTC, 0xFED1F404)
    Name (FLSZ, 0x00E00000)
    Name (SRCB, 0xFED1C000)
    Name (RCLN, 0x4000)
    Name (PEBS, 0xF8000000)
    Name (PELN, 0x04000000)
    Name (LAPB, 0xFEE00000)
    Name (EGPB, 0xFED19000)
    Name (MCHB, 0xFED10000)
    Name (VTBS, 0xFED90000)
    Name (VTLN, 0x4000)
    Name (ACPH, 0xDE)
    Name (ASSB, Zero)
    Name (AOTB, Zero)
    Name (AAXB, Zero)
    Name (HIDK, 0x0303D041)
    Name (HIDM, 0x030FD041)
    Name (CIDK, 0x0B03D041)
    Name (CIDM, 0x130FD041)
    Name (PEHP, One)
    Name (SHPC, Zero)
    Name (PEPM, One)
    Name (PEER, One)
    Name (PECS, One)
    Name (ITKE, Zero)
    Name (MBEC, 0xFFFF)
    Name (FMBL, One)
    Name (FDTP, 0x02)
    Name (FUPS, 0x03)
    Name (FUWS, 0x04)
    Name (BGR, One)
    Name (BFR, 0x02)
    Name (BBR, 0x03)
    Name (BWC, 0x04)
    Name (BWT1, 0x20)
    Name (BFHC, 0x0100)
    Name (TRTP, One)
    Name (WDTE, One)
    Name (TRTD, 0x02)
    Name (TRTI, 0x03)
    Name (PFTI, 0x04)
    Name (GCDD, One)
    Name (DSTA, 0x0A)
    Name (DSLO, 0x0C)
    Name (DSLC, 0x0E)
    Name (PITS, 0x10)
    Name (SBCS, 0x12)
    Name (SALS, 0x13)
    Name (LSSS, 0x2A)
    Name (SOOT, 0x35)
    Name (PDBR, 0x4D)
    Name (BW1P, 0x21)
    Name (BW2C, 0x22)
    Name (BW2P, 0x23)
    Name (BSPC, 0x24)
    Name (BSPP, 0x25)
    Name (BHB, 0x30)
    Name (BFS2, 0x31)
    Name (BFS3, 0x32)
    Name (BFS4, 0x33)
    Name (BRH, 0x35)
    Name (SMIA, 0xB2)
    Name (SMIB, 0xB3)
    Name (OFST, 0x35)
    Name (TPMF, Zero)
    Name (TCMF, Zero)
    Name (TMF1, Zero)
    Name (TMF2, Zero)
    Name (TMF3, Zero)
    Name (TRST, 0x02)
    Name (PMLN, 0x0100)
    Name (GPLN, 0x0400)
    Name (IOST, 0x8400)
    Name (TOPM, Zero)
    Name (ROMS, 0xFFE00000)
    Name (VGAF, One)
    OperationRegion (GNVS, SystemMemory, 0xDC226C18, 0x7D)
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
        Processor (CPU0, 0x01, 0x00001810, 0x06) {}
        Processor (CPU1, 0x02, 0x00001810, 0x06) {}
        Processor (CPU2, 0x03, 0x00001810, 0x06) {}
        Processor (CPU3, 0x04, 0x00001810, 0x06) {}
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
            Name (_HID, EisaId ("PNP0C01")) // _HID: Hardware ID
            Name (_UID, 0x02) // _UID: Unique ID
            Name (_STA, 0x0F) // _STA: Status
            Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite, 0x20000000, 0x00200000, )
                Memory32Fixed (ReadWrite, 0x40000000, 0x00200000, )
            })
        }

        Device (PCI0)
        {
            Name (_ADR, Zero) // _ADR: Address
            Name (_UID, Zero)   // _UID: Unique ID
            Name (_BBN, Zero)
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_PRT, Package (0x1B)  // _PRT: PCI Routing Table (AR00)
            {
                Package (0x04) { 0x001FFFFF, Zero, Zero, 0x15}, 
                Package (0x04) { 0x001FFFFF,  One, Zero, 0x13}, 
                Package (0x04) { 0x001FFFFF, 0x02, Zero, 0x12}, 
                Package (0x04) { 0x001FFFFF, 0x03, Zero, 0x10}, 
                Package (0x04) { 0x0014FFFF, Zero, Zero, 0x10}, // XHC1
                Package (0x04) { 0x001DFFFF, Zero, Zero, 0x17}, // EHC1
                Package (0x04) { 0x001AFFFF, Zero, Zero, 0x10}, // EHC2
                Package (0x04) { 0x001BFFFF, Zero, Zero, 0x16}, // HDEF
                Package (0x04) { 0x0016FFFF, Zero, Zero, 0x10}, 
                Package (0x04) { 0x0016FFFF,  One, Zero, 0x13}, 
                Package (0x04) { 0x0016FFFF, 0x02, Zero, 0x12}, 
                Package (0x04) { 0x0016FFFF, 0x03, Zero, 0x11}, 
                Package (0x04) { 0x001CFFFF, Zero, Zero, 0x10}, // RP0n
                Package (0x04) { 0x001CFFFF,  One, Zero, 0x11}, // RP0n
                Package (0x04) { 0x001CFFFF, 0x02, Zero, 0x12}, // RP0n
                Package (0x04) { 0x001CFFFF, 0x03, Zero, 0x13}, // RP0n
                Package (0x04) { 0x0001FFFF, Zero, Zero, 0x10}, // PEGn
                Package (0x04) { 0x0001FFFF,  One, Zero, 0x11}, // PEGn
                Package (0x04) { 0x0001FFFF, 0x02, Zero, 0x12}, // PEGn
                Package (0x04) { 0x0001FFFF, 0x03, Zero, 0x13}, // PEGn
                Package (0x04) { 0x0002FFFF, Zero, Zero, 0x10}, // IGPU 
                Package (0x04) { 0x0003FFFF, Zero, Zero, 0x10}, // HDAU
                Package (0x04) { 0x0004FFFF, Zero, Zero, 0x10}, 
                Package (0x04) { 0x0004FFFF,  One, Zero, 0x11}, 
                Package (0x04) { 0x0004FFFF, 0x02, Zero, 0x12}, 
                Package (0x04) { 0x0004FFFF, 0x03, Zero, 0x13}, 
                Package (0x04) { 0x0019FFFF, Zero, Zero, 0x14}
            })
            OperationRegion (HBUS, PCI_Config, Zero, 0x0100)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                        Offset (0x40), 
                EPEN,   1, 
                    ,   11, 
                EPBR,   20, 
                        Offset (0x48), 
                MHEN,   1, 
                    ,   14, 
                MHBR,   17, 
                        Offset (0x50), 
                GCLK,   1, 
                        Offset (0x54), 
                D0EN,   1, 
                D1F2,   1, 
                D1F1,   1, 
                D1F0,   1, 
                        Offset (0x60), 
                PXEN,   1, 
                PXSZ,   2, 
                    ,   23, 
                PXBR,   6, 
                        Offset (0x68), 
                DIEN,   1, 
                    ,   11, 
                DIBR,   20, 
                        Offset (0x70), 
                    ,   20, 
                MEBR,   12, 
                        Offset (0x80), 
                    ,   4, 
                PM0H,   2, 
                        Offset (0x81), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                        Offset (0x82), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                        Offset (0x83), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                        Offset (0x84), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                        Offset (0x85), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                        Offset (0x86), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                        Offset (0x87), 
                        Offset (0xA8), 
                    ,   20, 
                TUUD,   19, 
                        Offset (0xBC), 
                    ,   20, 
                TLUD,   12, 
                        Offset (0xC8), 
                    ,   7, 
                HTSE,   1
            }

            OperationRegion (MCHT, SystemMemory, 0xFED10000, 0x1100)
            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, _Y00)
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEAFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFEB00000,         // Length
                    ,, _Y0E, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized) // _CRS: Current Resource Settings
            {
                CreateWordField (BUF0, ^_Y00._MAX, PBMX)
                Store (Subtract (ShiftRight (PELN, 0x14), 0x02), PBMX)
                CreateWordField (BUF0, ^_Y00._LEN, PBLN)
                Store (Subtract (ShiftRight (PELN, 0x14), One), PBLN)
                If (PM1L)
                {
                    CreateDWordField (BUF0, ^_Y01._LEN, C0LN)
                    Store (Zero, C0LN)
                }

                If (LEqual (PM1L, One))
                {
                    CreateBitField (BUF0, ^_Y01._RW, C0RW)
                    Store (Zero, C0RW)
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, ^_Y02._LEN, C4LN)
                    Store (Zero, C4LN)
                }

                If (LEqual (PM1H, One))
                {
                    CreateBitField (BUF0, ^_Y02._RW, C4RW)
                    Store (Zero, C4RW)
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, ^_Y03._LEN, C8LN)
                    Store (Zero, C8LN)
                }

                If (LEqual (PM2L, One))
                {
                    CreateBitField (BUF0, ^_Y03._RW, C8RW)
                    Store (Zero, C8RW)
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, ^_Y04._LEN, CCLN)
                    Store (Zero, CCLN)
                }

                If (LEqual (PM2H, One))
                {
                    CreateBitField (BUF0, ^_Y04._RW, CCRW)
                    Store (Zero, CCRW)
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, ^_Y05._LEN, D0LN)
                    Store (Zero, D0LN)
                }

                If (LEqual (PM3L, One))
                {
                    CreateBitField (BUF0, ^_Y05._RW, D0RW)
                    Store (Zero, D0RW)
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, ^_Y06._LEN, D4LN)
                    Store (Zero, D4LN)
                }

                If (LEqual (PM3H, One))
                {
                    CreateBitField (BUF0, ^_Y06._RW, D4RW)
                    Store (Zero, D4RW)
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, ^_Y07._LEN, D8LN)
                    Store (Zero, D8LN)
                }

                If (LEqual (PM4L, One))
                {
                    CreateBitField (BUF0, ^_Y07._RW, D8RW)
                    Store (Zero, D8RW)
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, ^_Y08._LEN, DCLN)
                    Store (Zero, DCLN)
                }

                If (LEqual (PM4H, One))
                {
                    CreateBitField (BUF0, ^_Y08._RW, DCRW)
                    Store (Zero, DCRW)
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, ^_Y09._LEN, E0LN)
                    Store (Zero, E0LN)
                }

                If (LEqual (PM5L, One))
                {
                    CreateBitField (BUF0, ^_Y09._RW, E0RW)
                    Store (Zero, E0RW)
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, ^_Y0A._LEN, E4LN)
                    Store (Zero, E4LN)
                }

                If (LEqual (PM5H, One))
                {
                    CreateBitField (BUF0, ^_Y0A._RW, E4RW)
                    Store (Zero, E4RW)
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, ^_Y0B._LEN, E8LN)
                    Store (Zero, E8LN)
                }

                If (LEqual (PM6L, One))
                {
                    CreateBitField (BUF0, ^_Y0B._RW, E8RW)
                    Store (Zero, E8RW)
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, ^_Y0C._LEN, ECLN)
                    Store (Zero, ECLN)
                }

                If (LEqual (PM6H, One))
                {
                    CreateBitField (BUF0, ^_Y0C._RW, ECRW)
                    Store (Zero, ECRW)
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, ^_Y0D._LEN, F0LN)
                    Store (Zero, F0LN)
                }

                If (LEqual (PM0H, One))
                {
                    CreateBitField (BUF0, ^_Y0D._RW, F0RW)
                    Store (Zero, F0RW)
                }

                CreateDWordField (BUF0, ^_Y0E._MIN, M1MN)
                CreateDWordField (BUF0, ^_Y0E._MAX, M1MX)
                CreateDWordField (BUF0, ^_Y0E._LEN, M1LN)
                ShiftLeft (TLUD, 0x14, M1MN)
                Add (Subtract (M1MX, M1MN), One, M1LN)
                Return (BUF0)
            }

            Device (PDRC)
            {
                Name (_HID, EisaId ("PNP0C02")) // _HID: Hardware ID
                Name (_UID, One) // _UID: Unique ID
                Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
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
                    Memory32Fixed (ReadWrite, 0xF7FEF000, 0x00001000, )
                    Memory32Fixed (ReadWrite, 0xF7FF0000, 0x00001000, )
                })
            }

            Device (MCHC)
            {
                Name (_ADR, Zero) // _ADR: Address
            }

            Device (IGPU)
            {
                Name (_ADR, 0x00020000) // _ADR: Address

                Method (_DSM, 4, NotSerialized)
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

            Device (P0P2)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table (AR02)
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
                    Name (_ADR, One) // _ADR: Address
                } */

            }

            Device (HDAU)
            {
                Name (_ADR, 0x00030000)
                Name (_STA, 0x0F) // _STA: Status

                OperationRegion (HDAH, PCI_Config, 0x54, One)
                Field (HDAH, ByteAcc, NoLock, Preserve)
                {
                        ,   5, 
                    AUDE,   1
                }

                Method (_INI, 0, NotSerialized)
                {
                    Store (One, AUDE)
                    Notify (PCI0, Zero)
                }

                Method (_DSM, 4, NotSerialized)
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
                Method (_DSM, 4, NotSerialized)
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

            Device (GIGE)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0D, 
                    0x04
                })
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000) // _ADR: Address
                OperationRegion (SMIE, SystemIO, PMBS, 0x04)
                Field (SMIE, ByteAcc, NoLock, Preserve)
                {
                        ,   10, 
                    RTCS,   1
                }

                OperationRegion (SLPR, SystemIO, SMCR, 0x08)
                Field (SLPR, ByteAcc, NoLock, Preserve)
                {
                        ,   4, 
                    SLPE,   1, 
                        ,   31, 
                    SLPX,   1
                }

                Method (SPTS, 1, NotSerialized)
                {
                    Store (One, SLPX)
                    Store (One, SLPE)
                }

                Method (SWAK, 1, NotSerialized)
                {
                    Store (Zero, SLPE)
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200")) // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
                    {
                        IO (Decode16, 0x0000, 0x0000, 0x01, 0x20,)
                        IO (Decode16, 0x0081, 0x0081, 0x01, 0x11,)
                        IO (Decode16, 0x0093, 0x0093, 0x01, 0x0D,)
                        IO (Decode16, 0x00C0, 0x00C0, 0x01, 0x20,)
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (EC)
                {
                    Name (_HID, EisaId ("PNP0C09")) // _HID: Hardware ID
                    Name (_UID, One) // _UID: Unique ID
                    Name (_STA, Zero) // _STA: Status
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800")) // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103")) // _HID: Hardware ID
                    Name (_UID, Zero) // _UID: Unique ID
                    Name (_STA, 0x0F) // _STA: Status
                    Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
                    {
                        Memory32Fixed (ReadWrite, 0xFED00000, 0x00000400, )
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000")) // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
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
                    Name (_HID, EisaId ("PNP0C04")) // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
                    {
                        IO (Decode16, 0x00F0, 0x00F0, 0x01, 0x01, )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02")) // _HID: Hardware ID
                    Name (_UID, 0x02) // _UID: Unique ID
                    Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
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
                    Name (_HID, EisaId ("PNP0B00")) // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
                    {
                        IO (Decode16, 0x0070, 0x0070, 0x01, 0x08, )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100")) // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
                    {
                        IO (Decode16, 0x0040, 0x0040, 0x01, 0x04, )
                        IO (Decode16, 0x0050, 0x0050, 0x10, 0x04, )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (RMSC)
                {
                    Name (_HID, EisaId ("PNP0C02")) // _HID: Hardware ID
                    Name (_UID, 0x10) // _UID: Unique ID
                    Name (_CRS, ResourceTemplate () // _CRS: Current Resource Settings
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
                Name (_ADR, 0x001F0002) // _ADR: Address
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003) // _ADR: Address
                Device (BUS0)
                {
                    Name (_CID, "smbus")
                    Name (_ADR, Zero)
                }

                Device (BUS1)
                {
                    Name (_CID, "smbus")
                    Name (_ADR, One)
                }
            }

            Device (RP01)  // May not be enabled on (other) motherboards
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table (AR04)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x10 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x11 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x12 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x13 }
                })

                Device (PXSX)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x09, 
                        0x04
                    })
                }
            }

            Device (RP02) // May not be enabled on (other) motherboards
            {
                Name (_ADR, 0x001C0001) // _ADR: Address
                Name (_PRT, Package (0x04) // _PRT: PCI Routing Table (AR05)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x11 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x12 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x13 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x10 }
                })
            }

            Device (RP03) // May not be enabled on (other) motherboards
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table (AR06)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x12 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x13 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x10 },
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x11 }
                })
            }

            Device (RP04) // May not be enabled on (other) motherboards
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

            Device (RP05) // May not be enabled on (other) motherboards
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table (AR08)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x10 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x11 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x12 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x13 }
                })

                Device (ARPT)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x09, 
                        0x04
                    })
                }
            }

            Device (RP06) // May not be enabled on (other) motherboards
            {
                Name (_ADR, 0x001C0005) // _ADR: Address
                Name (_PRT, Package (0x04) // _PRT: PCI Routing Table (AR09)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x11 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x12 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x13 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x10 }
                })
            }

            Device (RP07) // May not be enabled on (other) motherboards
            {
                Name (_ADR, 0x001C0006) // _ADR: Address
                Name (_PRT, Package (0x04) // _PRT: PCI Routing Table (AR0E)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x12 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x13 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x10 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x11 }
                })
            }

            Device (RP08) // May not be enabled on (other) motherboards
            {
                Name (_ADR, 0x001C0007) // _ADR: Address
                Name (_PRT, Package (0x04) // _PRT: PCI Routing Table (AR0F)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x13 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x10 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x11 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x12 }
                })
            }

            Device (P0PA) // May not be enabled on (other) motherboards
            {
                Name (_ADR, 0x00010001) // _ADR: Address
                Name (_PRT, Package (0x04) // _PRT: PCI Routing Table (AR0A)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x11 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x12 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x13 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x10 }
                })
            }

            Device (P0PB) // May not be enabled on (other) motherboards
            {
                Name (_ADR, 0x00010002) // _ADR: Address
                Name (_PRT, Package (0x04) // _PRT: PCI Routing Table (AR0B)
                {
                    Package (0x04) { 0xFFFF, Zero, Zero, 0x12 }, 
                    Package (0x04) { 0xFFFF,  One, Zero, 0x13 }, 
                    Package (0x04) { 0xFFFF, 0x02, Zero, 0x10 }, 
                    Package (0x04) { 0xFFFF, 0x03, Zero, 0x11 }
                })
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

    Name (PCHS, One)
    Name (SRMB, 0xF7FF0000)

    OperationRegion (MBAR, SystemMemory, Add (ShiftLeft (\_SB.PCI0.MHBR, 0x0F), 0x5000), 0x1000)
    Field (MBAR, ByteAcc, NoLock, Preserve)
    {
                Offset (0x938), 
        PWRU,   4, 
                Offset (0x9A0), 
        PPL1,   15, 
        PL1E,   1, 
        CLP1,   1
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
            Notify (\_SB.PCI0.RP06, 0x02)
            Notify (\_SB.PCI0.RP07, 0x02)
            Notify (\_SB.PCI0.RP08, 0x02)
        }

        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PWRB, 0x02)
            Notify (\_SB.PCI0.XHC1, 0x02)
            Notify (\_SB.PCI0.HDEF, 0x02)
            Notify (\_SB.PCI0.GIGE, 0x02)
        }

        Method (_L01, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
        }

        Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (Zero, GPEC)
        }

        Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
        }

        Method (_L07, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
        }
    }

    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, GPIC)
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (Arg0)
        {
            \_SB.PCI0.LPCB.SPTS (Arg0)
        }
    }

    Method (_WAK, 1, Serialized)  // _WAK: Wake
    {
        \_SB.PCI0.LPCB.SWAK (Arg0)

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

