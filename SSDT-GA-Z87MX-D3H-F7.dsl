/*
 * Credits: Master Chief (dad) for his stripped down copy of Method (_DSM) and teaching us
 *          to code, and of course his inspiring talent to help other people for free.
 *
 *          RevoGirl (my late sister Samantha) for the first ever tiny SSDT, and her
 *          discovery of property 'hda-gfx' in her MacBook Pro (at a time that the hardware
 *          wasn't even released).
 *
 *          Pike for stripping method _DSM even further and finding a way to disable/hide
 *          devices in the DSDT, including ThermalZones. Something that was impossible until now.
 */

DefinitionBlock ("SSDT.aml", "SSDT-GA-Z87MX-D3G-F7.aml", 1, "APPLE", "tinySSDT", 0x00000006)
{
    External (\IOST, IntObj)

    External (\_SB_.PCI0, DeviceObj)
    External (\_SB_.WCAM, DeviceObj)

    External (\_SB_.LNKA._STA, IntObj)
    External (\_SB_.LNKB._STA, IntObj)
    External (\_SB_.LNKC._STA, IntObj)
    External (\_SB_.LNKD._STA, IntObj)
    External (\_SB_.LNKE._STA, IntObj)
    External (\_SB_.LNKF._STA, IntObj)
    External (\_SB_.LNKG._STA, IntObj)
    External (\_SB_.LNKH._STA, IntObj)

    External (\_SB_.PCI0.B0D3._STA, IntObj)
    External (\_SB_.PCI0.B0D4, DeviceObj)
    External (\_SB_.PCI0.GFX0, DeviceObj)
    External (\_SB_.PCI0.HDEF, DeviceObj)
    External (\_SB_.PCI0.LPCB, DeviceObj)
    External (\_SB_.PCI0.LPCB.SIO1, DeviceObj)
    External (\_SB_.PCI0.RP05, DeviceObj)
    External (\_SB_.PCI0.RP05.PXSX, DeviceObj)
    External (\_SB_.PCI0.PEG1, DeviceObj)
    External (\_SB_.PCI0.SAT0, DeviceObj)
    External (\_SB_.PCI0.SAT1, DeviceObj)
    External (\_SB_.PCI0.TPMX._STA, DeviceObj)
    External (\_SB_.PCI0.WMI1, DeviceObj)

    External (\_TZ_.FAN0, DeviceObj)
    External (\_TZ_.FAN1, DeviceObj)
    External (\_TZ_.FAN2, DeviceObj)
    External (\_TZ_.FAN3, DeviceObj)
    External (\_TZ_.FAN4, DeviceObj)

    External (\_TZ_.TZ00, PkgObj)
    External (\_TZ_.TZ01, PkgObj)

    Scope (\_SB_)
    {
        Method (_INI, 0, NotSerialized)
        {
            /* Here we disable/hide Devices (LNKx) */

            Store (Zero, \_SB_.LNKA._STA)
            Store (Zero, \_SB_.LNKB._STA)
            Store (Zero, \_SB_.LNKC._STA)
            Store (Zero, \_SB_.LNKD._STA)
            Store (Zero, \_SB_.LNKE._STA)
            Store (Zero, \_SB_.LNKF._STA)
            Store (Zero, \_SB_.LNKG._STA)
            Store (Zero, \_SB_.LNKH._STA)

            /* Here we disable/hide Devices (B0D3) */

            Store (Zero, \_SB_.PCI0.B0D3._STA)

            /* Here we disable/hide Devices (TMPX) */

            Store (Zero, \_SB_.PCI0.TPMX._STA)

            /* Here we disable/hide Devices (PS2x) */

            Store (Zero, \IOST)

            /* Here we disable/hide ThermalZone (TZ0n) */

            Store (Zero, \_TZ_.TZ00)
            Store (Zero, \_TZ_.TZ01)
        }

        /* Here we disable/hide Device (WCAM) */

        Scope (WCAM)
        {
            Name (_STA, Zero)
        }
    }

    Scope (\_SB_.PCI0)
    {
        /* Here we inject a new Device (MCHC) */

        Device (MCHC)
        {
            Name (_ADR, Zero)
        }

        /* Here we inject a new Device (HECI) */

        Device (HECI)
        {
            Name (_ADR, 0x00160000)
        }

        /* Here we disable/hide Device (GFX0) */

        Scope (GFX0)
        {
            Name (_STA, Zero)
        }

        /* Here we inject a new Device (IGPU) */

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

        /* Here we inject a new Device (HDAU) */

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

            /* Here we inject a new Method (_DSM) */

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

        /* Here we disable/hide Device (B0D4) */

        Scope (B0D4)
        {
            Name (_STA, Zero)
        }

        /* Here we add (audio related) properties to Device (HDEF) */

        Scope (HDEF)
        {
            /* Here we inject a new Method (_DSM) */

            Method (_DSM, 4, NotSerialized)
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                        0x03
                    })
                }

                Return (Package (0x04)
                {
                    "layout-id",
                    Buffer (0x04)
                    {
                        0x01, 0x00, 0x00, 0x00
                    },

                    "PinConfigurations",
                    Buffer (Zero) {}
                })
            }
        }

        Scope (LPCB)
        {
            /* Here we disable/hide Device (SIO1) */

            Scope (SIO1)
            {
                Name (_STA, Zero)
            }
        }

        /* RP05 is used for my Wifi/Bluetooth 4.0 card, installed in slot 'PCIEX4' */

        Scope (RP05)
        {
            /* Here we disable/hide Device (PSXS) */

            Scope (PXSX)
            {
                Name (_STA, Zero)
            }

            /* Here we inject a new device (ARPT) */

            Device (ARPT)
            {
                Name (_ADR, Zero)
                Name (_PRW, Package (0x02)
                {
                    0x09, 
                    0x04
                })
            }
        }

        /* PEG1 is used for my PCIe card with M.2, installed in slot 'PCIEX8' */

        Scope (\_SB.PCI0.PEG1)
        {
            /* Here we inject a new device (SSD0) for the PCIe card with M.2 */

            Device (SSD0)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (NVME, One)
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If (LEqual (Arg2, Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03
                        })
                    }

                    If (LEqual (NVME, One))
                    {
                        Return (Package (0x04)
                        {
                            "use-msi", 
                            One, 
                            "nvme-LPSR-during-S3-S4", 
                            One
                        })
                    }
                    Else
                    {
                        Return (Package (0x06)
                        {
                            "use-msi", 
                            One, 
                            "sata-express-power-off", 
                            One, 
                            "ssd-off-in-S4", 
                            One
                        })
                    }
                }

                Device (PRT0)
                {
                    Name (_ADR, 0xFFFF)  // _ADR: Address
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
                            "io-device-location", 
                            Buffer (0x04)
                            {
                                "SSD"
                            }
                        })
                    }
                }
            }
        }

        /* Here we disable/hide Device (SAT0) */

        Scope (SAT0)
        {
            Name (_STA, Zero)
        }

        /* Here we disable/hide Device (SAT1) */

        Scope (SAT1)
        {
            Name (_STA, Zero)
        }

        /* Here we inject a new Device (SATA) */

        Device (SATA)
        {
            Name (_ADR, 0x001F0002)
        }

        /* Here we disable/hide Device (WMI1) */

        Scope (WMI1)
        {
            Name (_STA, Zero)
        }
    }

    Scope (\_TZ_)
    {
        /* Here we disable/hide Device (FAN0) */

        Scope (FAN0)
        {
            Name (_STA, Zero)
        }

        /* Here we disable/hide Device (FAN1) */

        Scope (FAN1)
        {
            Name (_STA, Zero)
        }

        /* Here we disable/hide Device (FAN2) */

        Scope (FAN2)
        {
            Name (_STA, Zero)
        }

        /* Here we disable/hide Device (FAN3) */

        Scope (FAN3)
        {
            Name (_STA, Zero)
        }

        /* Here we disable/hide Device (FAN4) */

        Scope (FAN4)
        {
            Name (_STA, Zero)
        }
    }
}
