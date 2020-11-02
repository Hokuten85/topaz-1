-- Settings for Disjoined One augments
local globalPlayer = nil

local augCost = {
                  [0] = 50000,
                  [1] = 100000,
                  [2] = 200000,
                  [3] = 400000,
                  [4] = 800000,
                  [5] = 1600000,
                  [6] = 3200000,
                  [7] = 6400000,
                  [8] = 12800000,
                  [9] = 25600000,
                  RemovalFee = 12345
                };
                
local nmDropItem = {
                    [0] = 4064,
                    [1] = 4065,
                    [2] = 4066,
                    [3] = 4067,
                    [4] = 4068,
                    [5] = 4069,
                    [6] = 4070,
                    [7] = 4071,
                    [8] = 4072,
                    [9] = 4073,
                    [4064] = "Rem's Tale Ch.1",
                    [4065] = "Rem's Tale Ch.2",
                    [4066] = "Rem's Tale Ch.3",
                    [4067] = "Rem's Tale Ch.4",
                    [4068] = "Rem's Tale Ch.5",
                    [4069] = "Rem's Tale Ch.6",
                    [4070] = "Rem's Tale Ch.7",
                    [4071] = "Rem's Tale Ch.8",
                    [4072] = "Rem's Tale Ch.9",
                    [4073] = "Rem's Tale Ch.10"
                };

local itemMap = {
                 [0] = 1488,
                 [1] = 1489,
                 [2] = 1490,
                 [3] = 1491,
                 [4] = 1492,
                 [5] = 1493,
                 [6] = 1494,
                 [7] = 1495,
                 [8] = 1496,
                 [9] = 1497,
                 [10] = 1498,
                 [11] = 1499,
                 [12] = 1500,
                 [13] = 1501,
                 [14] = 1502,
                 [15] = 1503,
                 [16] = 1504,
                 [17] = 1505,
                 [18] = 1506,
                 [19] = 1507,
                 [20] = 1508,
                 [21] = 1509,
                 [22] = 1510,
                 [23] = 1511,
                 [24] = 1512,
                 [25] = 1513,
                 [26] = 474,
                 [27] = 475,
                 [28] = 476,
                 [29] = 477,
                 [30] = 478,
                 [31] = 479,
                 [32] = 480,
                 [33] = 481,
                 [1488] = "A Egg",
                 [1489] = "B Egg",
                 [1490] = "C Egg",
                 [1491] = "D Egg",
                 [1492] = "E Egg",
                 [1493] = "F Egg",
                 [1494] = "G Egg",
                 [1495] = "H Egg",
                 [1496] = "I Egg",
                 [1497] = "J Egg",
                 [1498] = "K Egg",
                 [1499] = "L Egg",
                 [1500] = "M Egg",
                 [1501] = "N Egg",
                 [1502] = "O Egg",
                 [1503] = "P Egg",
                 [1504] = "Q Egg",
                 [1505] = "R Egg",
                 [1506] = "S Egg",
                 [1507] = "T Egg",
                 [1508] = "U Egg",
                 [1509] = "V Egg",
                 [1510] = "W Egg",
                 [1511] = "X Egg",
                 [1512] = "Y Egg",
                 [1513] = "Z Egg",
                 [474] = "Red Chip",
                 [475] = "Blue Chip",
                 [476] = "Yellow Chip",
                 [477] = "Green Chip",
                 [478] = "Clear Chip",
                 [479] = "Purple Chip",
                 [480] = "White Chip",
                 [481] = "Black Chip"
                };

local skillMap = {
    [tpz.skill.HAND_TO_HAND] = "HAND_TO_HAND",
    [tpz.skill.DAGGER] = "DAGGER",
    [tpz.skill.SWORD] = "SWORD",
    [tpz.skill.GREAT_SWORD] = "GREAT_SWORD",
    [tpz.skill.AXE] = "AXE",
    [tpz.skill.GREAT_AXE] = "GREAT_AXE",
    [tpz.skill.SCYTHE] = "SCYTHE",
    [tpz.skill.POLEARM] = "POLEARM",
    [tpz.skill.KATANA] = "KATANA",
    [tpz.skill.GREAT_KATANA] = "GREAT_KATANA",
    [tpz.skill.CLUB] = "CLUB",
    [tpz.skill.STAFF] = "STAFF",
    [tpz.skill.ARCHERY] = "ARCHERY",
    [tpz.skill.MARKSMANSHIP] = "MARKSMANSHIP"
}                
    

local augmentMap = {
    [tpz.slot.MAIN] = { -- 2h weapons and h2h
        Melee = {
            Aug1 = {45,Multiplier=2}, -- DMG+1
            Aug2 = {
                HAND_TO_HAND = 257, -- Weapon skills
                GREAT_SWORD = 260,
                GREAT_AXE = 262,
                SCYTHE = 263,
                POLEARM = 264,
                GREAT_KATANA = 266,
                STAFF = 268
            },
            Aug3 = 142, -- Store tp+1
            Aug4 = 195 -- Subtle blow+1
        },
        Magic = {
            Aug1 = {362,329}, -- Magic Damage+1, Cure Pot+1%
             Aug2 = {288,289,290,291,292,293,294,295,296,299}, -- magic skills
            Aug3 = 140, -- fastcast+1
            Aug4 = 141 -- Conserve MP+1
        },
        Pet = {
            Aug1 = {97,126}, -- Pet Att/RAtt+1, Pet MDmg+1
            Aug2 = 96, -- Pett Acc/RAcc+1
            Aug3 = 115, -- Pet StoreTP+1
            Aug4 = 116 -- Pet Subtle Blow+1
        }
    },
    [tpz.slot.SUB] = { -- 1h weapons, shields, and grips
        Melee = {
            Aug1 = 45, -- DMG+1
            Aug2 = {
                DAGGER = 258,
                SWORD = 259,
                AXE = 261,
                KATANA = 265,
                CLUB = 267,
            },
            Aug3 = 142, -- Store tp+1
            Aug4 = 195, -- Subtle blow+1
            Shield = {
                Aug1 = {153,130}, -- Shield Mastery +1, Attack+1 RAtt+1
                Aug2 = {363,129}, -- Chance of Block+, Acc+1 Racc+1
                Aug3 = {796,142}, -- All Element Resist+1, StoreTP+1
                Aug4 = {42,195} -- Enemy Crit Hit rate-%, Subtle Blow+1
            },
            Grip = {
                Aug1 = 130, --Attack+1 RAtt+1
                Aug2 = 129, --Acc+1 Racc+1
                Aug3 = 142, --StoreTP+1
                Aug4 = 195 -- Subtle Blow+1
            }
        },
        Magic = {
            Aug1 = {362,329}, -- Magic Damage+1, Cure Pot+1%
             Aug2 = {288,289,290,291,292,293,294,295,296,299}, -- magic skills
            Aug3 = 140, -- fastcast+1
            Aug4 = 141, -- Conserve MP+1
            Shield = {
                Aug1 = {153,362,329}, -- Shield Mastery +1, Magic Damage+1, Cure Pot+1%
                Aug2 = {363,35},   -- Chance of Block+, MAcc+1
                Aug3 = {796,140},    -- All Element Resist+1, fastcast+1
                Aug4 = {42,141}      -- Enemy Crit Hit rate-%, Conserve MP+1
            },
            Grip = {
                Aug1 = {362,329}, -- Magic Damage+1, Cure Pot+1%
                Aug2 = 35, --MAcc+1
                Aug3 = 140, -- fastcast+1
                Aug4 = 141 --Conserve MP+1
            }
        },
        Pet = {
            Aug1 = {97,126}, -- Pet Att/RAtt+1, Pet MDmg+1
            Aug2 = 96, -- Pett Acc/RAcc+1
            Aug3 = 115, -- Pet StoreTP+1
            Aug4 = 116, -- Pet Subtle Blow+1
            Shield = {},
            Grip = {}
        }
    },
    [tpz.slot.RANGED] = {
        Melee = {
            Aug1 = {512,513,514,515,516,517,518}, -- STAT+1
            Aug2 = {39,40}, -- enmity+1/-1
            Aug3 = 142, -- StoreTP+1
            Aug4 = 195 -- Subtle Blow +1
        },
        Ranged = {
            Aug1 = {746,Multiplier=2}, -- R Dmg+1
            Aug2 = {
                ARCHERY = 281,
                MARKSMANSHIP = 282
            },
            Aug3 = 142, -- StoreTP+1
            Aug4 = 195, -- Subtle Blow +1
            Instrument = {
                Aug1 = {67, Max=2}, -- all songs+1
                Aug2 = 322, -- spell casting time
                Aug3 = {296, Max=5}, -- singing skill
                Aug4 = {297,298,Max=5} -- String Inst Skill, Wind Inst Skill
            }
        },
        Pet = {
            Animator = {
                Aug1 = 278, --Automaton Melee Skill+
                Aug2 = 279, --Automaton Range Skill+
                Aug3 = 280, --Automaton Magic Skill+
                Aug4 = {99,Multiplier=2} -- Pet Def+2
            }
        }
    },
    [tpz.slot.AMMO] = {
        Melee = {
            Aug1 = {512,513,514,515,516,517,518}, -- STAT+1
            Aug2 = {39,40}, -- enmity+1/-1
            Aug3 = 142, -- StoreTP+1
            Aug4 = 195 -- Subtle Blow +1
        },
        Pet = {
            Aug1 = {1792,1793,1794,1795,1796,1797,1798}, -- Pet: Stat+1
            Aug2 = 105 -- Pet: Enmity -1
        },
        Max=5
    },
    [tpz.slot.HEAD] = {
        Melee = {
            Aug1 = 143, -- Double Attack+1
            Aug2 = 129, -- Acc & RAcc+1
            Aug3 = 195, -- Subtle blow+1
            Aug4 = {37,134} -- MEva+1 OR MDB+1
        },
        Ranged = {
            Aug1 = 211, -- Snapshot+1
            Aug3 = 195, -- Subtle blow+1
            Aug4 = {37,134} -- MEva+1 OR MDB+1
        },
        Magic = {
            Aug1 = 140, -- Fastcast+1
            Aug2 = 35, -- MAcc+1
            Aug3 = 141, -- Conserve MP+1
            Aug4 = {37,134} -- MEva+1 OR MDB+1
        },
        Pet = {
            Aug1 = 123, -- Pet DA+1
            Aug2 = {96,100}, -- Pet Acc & RAcc+1 OR Macc+1
            Aug3 = 116, --Pet Sublte Blow+1
            Aug4 = {117,119} -- Pet MEva+1 OR MDB+1
        }
    },
    [tpz.slot.BODY] = {
        Melee = {
            Aug1 = 1152, -- Def+10
            Aug2 = {1,Multiplier=10}, -- HP+10
            Aug3 = {512,513,514,515,516,517,518}, -- Stat+1
            Aug4 = {41,328} -- crit hit rate+1 OR Crit Hit DMG+1
        },
        Magic = {
            Aug2 = {9,Multiplier=10}, -- MP+10
            Aug4 = {57,335} -- Mag Crit Hit rate+1 OR Mag Crit Hit Dmg+1
        },
        Pet = {
            Aug1 = {99,Multiplier=10}, -- Pet Def+10
            Aug3 = {1792,1793,1794,1795,1796,1797,1798}, -- Pet Stat+1
            Aug4 = 102 -- Pet Crit hit rate
        }
    },
    [tpz.slot.HANDS] = {
        Melee = {
            Aug1 = 129, -- Acc & RAcc+1
            Aug2 = 130, -- Att & RAtt+1
            Aug3 = 144, -- Triple Att+1
            Aug4 = {512,513,514,515,516,517,518}, -- Stat+1
        },
        Ranged = {
            Aug3 = {139,211} -- Rapid Shot or Snapshot+1
        },
        Magic = {
            Aug1 = 35, -- MAcc+1
            Aug2 = 101, -- MAB+1
            Aug3 = {57,335} -- Mag Crit Rate or DMG+1
        },
        Pet = {
            Aug1 = {96,100}, -- Pet Acc & RAcc+1 OR MAcc+1
            Aug2 = {97,101}, -- Pet Att & RAtt+1 OR MAB+1
            Aug3 = {123,126}, -- Pet Dbl Att+1 OR Mag Dmg+1
            Aug4 = {1792,1793,1794,1795,1796,1797,1798}, -- Pet Stat+1
        }
    },
    [tpz.slot.LEGS] = {
        Melee = {
            Aug1 = 142, -- Store TP+1
            Aug2 = {41,328}, -- Crit Hit Rate OR Crit Dmg+1%
            Aug3 = 1153, -- Evasion+3
            Aug4 = {1,Multiplier=5}, -- HP+5
        },
        Magic = {
            Aug1 = 141, -- Conserve MP+1
            Aug2 = {57,335}, -- Mag Crit Hite Rate or DMG+1
            Aug3 = 1154, -- Mag Eva +3
            Aug4 = {9,Multiplier=5}, -- MP+5
        },
        Pet = {
            Aug1 = 115, -- Pet StoreTP+1
            Aug2 = 102, -- Pet Crit hit rate+1
            Aug3 = {98,117}, -- Pet Eva OR MEva+1
        }
    },
    [tpz.slot.FEET] = {
        Melee = {
            Aug1 = 49, -- Haste+1
            Aug2 = 68, -- Acc & Att+1
            Aug3 = {146,144}, -- dual wield or Triple Att+1
            Aug4 = 31 -- Eva+1
        },
        Ranged = {
            Aug2 = 69 -- RAcc & RAtt+1
        },
        Magic = {
            Aug2 = 133, -- MAB+1
            Aug3 = 334, -- Magic Burst Dmg+1%
            Aug4 = {37,134} -- MEva+1 OR MDB+1
        },
        Pet = {
            Aug1 = 111, -- Pet haste+1
            Aug2 = {101,124}, --MAB+1 OR Acc/RAcc/Att/RAtt+1
            Aug3 = 123, -- Pet DA+1
            Aug4 = {98,117}
        }
    },
    [tpz.slot.NECK] = {
        Melee = {
            Aug1 = {39,40}, -- Enmity+1/-1
            Aug2 = {1,Multiplier=5}, -- HP+5
            Aug3 = {33,Multiplier=2} -- Def+2
        },
        Magic = {
            Aug2 = {9,Multiplier=5} -- MP+5
        },
        Pet = {
            Aug1 = 105 -- Pet Enmity-1
        },
        Max=5
    },
    [tpz.slot.WAIST] = {
        Melee = {
            Aug1 = 49, -- Haste+1
            Aug2 = 68 -- Acc & Att+1
        },
        Ranged = {
            Aug2 = 69 -- RAcc & RAtt+1
        },
        Magic = {
            Aug2 = 35 -- MAcc
        },
        Pet = {
            Aug1 = 111, -- Pet Haste+1
            Aug2 = 96 -- Pet Acc & RAcc+1
        },
        Max=5
    },
    [tpz.slot.EAR2] = {
        Melee = {
            Aug1 = {257,258,259,260,261,262,263,264,265,266,267,268}, -- weapon skill+1
            Aug2 = {39,40,195,Max=2}, --Enmity +1, enmity-1, Subtle blow +1
            Aug3 = {286,Max=3} -- shield skill+1
        },
        Ranged = {
            Aug1 = {281,282,283} -- Ranged Skills+1
        },
        Magic = {
            Aug1 = {288,289,290,291,292,293,294,295,296,299}, -- Magic Skills+1
            Aug3 = {134,Max=3} -- MDB+1
        },
        Pet = {
            Aug1 = {278,279,280} -- Auto Melee Skill, Auto Ranged, Auto Magic
        },
        Max=5
    },
    [tpz.slot.RING2] = {
        Melee = {
            Aug1 = {512,513,514,515,516,517,518}, --Stat +1
            Aug2 = 796 -- All Element resist
        },
        Pet = {
            Aug1 = {1792,1793,1794,1795,1796,1797,1798} -- Pet Stat+1
        },
        Max=5
    },
    [tpz.slot.BACK] = {
        Melee = {
            Aug1 = 1152, -- Def+10
            Aug2 = 42, -- Enemy Crit hit rate -%
            Aug3 = 71 -- Damage taken -1%
        },
        Pet = {
            Aug1 = {99,Multiplier=10}, --Pet Def+10
            Aug2 = 103, -- Pet Enemy Crit hit rate -%
            Aug3 = 112 -- Pet Dmg taken -1
        },
        Max=5
    }
};

local tierIds = { -- used for translating augs that have tiers
    [2] = 1,
    [3] = 1,
    [4] = 1,
    [10] = 9,
    [11] = 9,
    [12] = 9,
}
                
local augments = {
                    [1] =    {Description = "HP+%s", NextAugId = 2},
                    [2] =    {Description = "HP+%s", NextAugId = 3,  BaseValue = 33},
                    [3] =    {Description = "HP+%s", NextAugId = 4,  BaseValue = 65},
                    [4] =    {Description = "HP+%s",                  BaseValue = 97},
                    [9] =    {Description = "MP+%s", NextAugId = 10},
                    [10] =   {Description = "MP+%s", NextAugId = 11, BaseValue = 33},
                    [11] =   {Description = "MP+%s", NextAugId = 12, BaseValue = 65},
                    [12] =   {Description = "MP+%s",                  BaseValue = 97},
                    [31] =   {Description = "Evasion+1"},
                    [33] =   {Description = "DEF+%s"},
                    [35] =   {Description = "Mag.Acc+1"},
                    [37] =   {Description = "Mag.Evasion+1"},
                    [39] =   {Description = "Enmity+1"},
                    [40] =   {Description = "Enmity-1"},
                    [41] =   {Description = "Crit.hit rate+1"},
                    [42] =   {Description = "Enemy crit. hit rate -1%%"},
                    [45] =   {Description = "DMG+1"}, -- MELEE
                    [49] =   {Description = "Haste+1"},
                    [57] =   {Description = "Magic crit. hit rate+1"},
                    [67] =   {Description = "All songs+1"},
                    [68] =   {Description = "Accuracy+1 Attack+1"},
                    [69] =   {Description = "Rng.Acc.+1 Rng.Atk.+1"},
                    [71] =   {Description = "Damage Taken -1%%"},
                    [96] =   {Description = "Pet: Accuracy+1 Rng.Acc+1"},
                    [97] =   {Description = "Pet: Attack+1 Rng.Atk.+1"},
                    [98] =   {Description = "Pet: Evasion+1"},
                    [99] =   {Description = "Pet: DEF+%s"},
                    [100] =  {Description = "Pet: Mag.Acc.+1"},
                    [101] =  {Description = "Pet: Mag.Atk.Bns.+1"},
                    [102] =  {Description = "Pet: Crit.hit rate+1"},
                    [103] =  {Description = "Pet: Enemy crit. hit rate -1"},
                    [105] =  {Description = "Pet: Enmity-1"},
                    [111] =  {Description = "Pet: Haste+1"},
                    [112] =  {Description = "Pet: Damage taken -1%%"},
                    [115] =  {Description = "Pet: Store TP+1"},
                    [116] =  {Description = "Pet: Subtle Blow+1"},
                    [117] =  {Description = "Pet: Mag. Evasion+1"},
                    [119] =  {Description = "Pet: Mag.Def.Bns.+1"},
                    [123] =  {Description = "Pet: Dbl.Att.+1"},
                    [124] =  {Description = "Pet: Acc+1/R.Acc+1/Atk.+1/R.Atk.+1"},
                    [126] =  {Description = "Pet: Magic Damage +1"},
                    [129] =  {Description = "Accuracy+1 Rng.Acc.+1"},
                    [130] =  {Description = "Attack+1 Rng.Atk.+1"},
                    [133] =  {Description = "Mag.Atk.Bns.+1"},
                    [134] =  {Description = "Mag.Def.Bns.+1"},
                    [139] =  {Description = "Rapid Shot+1"},
                    [140] =  {Description = "Fastcast+1"},
                    [141] =  {Description = "Conserve MP+1" },
                    [142] =  {Description = "Store TP+1"},
                    [143] =  {Description = "Dbl.Atk.+1"},
                    [144] =  {Description = "Triple Atk.+1"},
                    [146] =  {Description = "Dual Wield+1"},
                    [153] =  {Description = "Shield Mastery+1"},
                    [195] =  {Description = "Subtle Blow+1"},
                    [211] =  {Description = "Snapshot+1"},
                    [257] =  {Description = "Hand-to-Hand skill+1"},
                    [258] =  {Description = "Dagger skill+1"},
                    [259] =  {Description = "Sword skill+1"},
                    [260] =  {Description = "Great Sword skill+1"},
                    [261] =  {Description = "Axe skill+1"},
                    [262] =  {Description = "Great Axe skill+1"},
                    [263] =  {Description = "Scythe skill+1"},
                    [264] =  {Description = "Polearm skill+1"},
                    [265] =  {Description = "Katana skill+1"},
                    [266] =  {Description = "Great Katana skill+1"},
                    [267] =  {Description = "Club skill+1"},
                    [268] =  {Description = "Staff skill+1"},
                    [278] =  {Description = "Automaton Melee skill+1"},
                    [279] =  {Description = "Automaton Ranged skill+1"},
                    [280] =  {Description = "Automaton Magic skill+1"},
                    [281] =  {Description = "Archery skill+1"},
                    [282] =  {Description = "Marksmanship skill+1"},
                    [283] =  {Description = "Throwing skill+1"},
                    [286] =  {Description = "Shield skill+1"},
                    [288] =  {Description = "Divine magic skill+1"},
                    [289] =  {Description = "Healing magic skill+1"},
                    [290] =  {Description = "Enha.mag. skill+1"},
                    [291] =  {Description = "Enfb.mag. skill+1"},
                    [292] =  {Description = "Elem. magic skill+1"},
                    [293] =  {Description = "Dark magic skill+1" },
                    [294] =  {Description = "Summoning magic skill+1"},
                    [295] =  {Description = "Ninjutsu skill+1"},
                    [296] =  {Description = "Singing skill+1"},
                    [297] =  {Description = "String instrument skill+1"},
                    [298] =  {Description = "Wind instrument skill+1"},
                    [299] =  {Description = "Blue Magic skill+1"},
                    [300] =  {Description = "Geomancy Skill+1"},
                    [322] =  {Description = "Song spellcasting time -1%%"},
                    [328] =  {Description = "Crit. hit damage+1%%"},
                    [329] =  {Description = "Cure Potency+1%%"},
                    [335] =  {Description = "Mag. crit. hit dmg.+1%%"},
                    [362] =  {Description = "Magic Damage+1"},
                    [363] =  {Description = "Chance of successful block+1"},
                    [512] =  {Description = "STR+1"},
                    [513] =  {Description = "DEX+1"},
                    [514] =  {Description = "VIT+1"},
                    [515] =  {Description = "AGI+1"},
                    [516] =  {Description = "INT+1"},
                    [517] =  {Description = "MND+1"},
                    [518] =  {Description = "CHR+1"},
                    [746] =  {Description = "DMG+1"}, -- RANGED
                    [796] =  {Description = "All elemental resists+1"},
                    [1152] = {Description = "DEF+10"},
                    [1153] = {Description = "Evasion+3"},
                    [1154] = {Description = "Mag.Evasion+3"},
                    [1792] = {Description = "Pet: STR+1"},
                    [1793] = {Description = "Pet: DEX+1"},
                    [1794] = {Description = "Pet: VIT+1"},
                    [1795] = {Description = "Pet: AGI+1"},
                    [1796] = {Description = "Pet: INT+1"},
                    [1797] = {Description = "Pet: MND+1"},
                    [1798] = {Description = "Pet: CHR+1"},
                    }
                    
local npcMap = {
    -- South Sandy
    [17719919] = {AugType = "Melee", Aug = "Aug1", AugIdx = 1},
    [17719920] = {AugType = "Melee", Aug = "Aug2", AugIdx = 2},
    [17719917] = {AugType = "Melee", Aug = "Aug3", AugIdx = 3},
    [17719918] = {AugType = "Melee", Aug = "Aug4", AugIdx = 4},
    
    -- Port Sandy
    [17727673] = {AugType = "Ranged", Aug = "Aug1", AugIdx = 1},
    [17727674] = {AugType = "Ranged", Aug = "Aug2", AugIdx = 2},
    [17727677] = {AugType = "Ranged", Aug = "Aug3", AugIdx = 3},
    [17727678] = {AugType = "Ranged", Aug = "Aug4", AugIdx = 4},
    
    --Bastok Mines
    [17736005] = {AugType = "Magic", Aug = "Aug1", AugIdx = 1},
    [17736007] = {AugType = "Magic", Aug = "Aug2", AugIdx = 2},
    [17736009] = {AugType = "Magic", Aug = "Aug3", AugIdx = 3},
    [17736012] = {AugType = "Magic", Aug = "Aug4", AugIdx = 4},

    -- Windhurst Walls
    [17756444] = {AugType = "Pet", Aug = "Aug1", AugIdx = 1},
    [17756445] = {AugType = "Pet", Aug = "Aug2", AugIdx = 2},
    [17756446] = {AugType = "Pet", Aug = "Aug3", AugIdx = 3},
    [17756447] = {AugType = "Pet", Aug = "Aug4", AugIdx = 4}
}

function handleOnTrade(player,npc,trade)
    globalPlayer = player
    local npcName = npc:getName():gsub("_"," ")
    local augmentType = npcMap[npc:getID()].AugType
    local augmentSlot = npcMap[npc:getID()].Aug
    local augmentIdx = npcMap[npc:getID()].AugIdx-1
    local maxTier = 10;
    
    if (trade:getSlotCount() == 1) then
        local item = trade:getItem()
        if (item:isType(tpz.itemType.ARMOR)) then
            local augmentId, augmentValue = item:getAugment(augmentIdx);
            
            local slotType = item:getSlotType()
            local skillType = item:getSkillType()
            
            local augmentList, maxTier = getAugmentList(slotType, augmentType, augmentSlot, item)
            if (augmentList) then
                if (augmentId > 0) then
                    local augment = checkForMatchingAugId(augmentList, augmentId, skillType)
                    if augment ~= nil then
                        if augment.Max then
                            maxTier = augment.Max
                        end
                        
                        if (augments[augmentId].BaseValue ~= nil) then
                            augmentValue = augmentValue + augments[augmentId].BaseValue;
                        end
                        local currentAugTier = math.floor(augmentValue / augment.Multiplier)-- zero indexed
                        
                        if (augmentValue % augment.Multiplier ~= 0 or augment.Multiplier == 1) then
                            currentAugTier = currentAugTier + 1
                        end
                        
                        if (currentAugTier < maxTier) then
                            player:PrintToPlayer(string.format("Bring me %s Gil, and a %s to enhance your augment. %s", augCost[currentAugTier], getNMItemFromIndex(currentAugTier), string.format(augments[augmentId].Description,augment.Multiplier)), 0, npcName);
                        else
                            player:PrintToPlayer("I cannot enhance this further.", 0, npcName);
                            printCannotDoAnything(player, npc, augmentId)
                        end
                    else
                        printCannotDoAnything(player, npc, augmentId)
                    end
                else
                    sayAugmentOptions(augmentList, player, npc, skillType);
                end
            else
                printCannotDoAnything(player, npc, augmentId)
            end
        end
    elseif (trade:getSlotCount() == 3 or trade:getSlotCount() == 4) then
        local tradeGil = trade:getGil();
        if tradeGil > 0 then
            local gearItem, nmItemId, augItemId;
            for i = 1, 8 do
                local itemId = trade:getItemId(i);
                if (itemId > 0) then
                    local item = trade:getItem(i);
                    if (item:isType(tpz.itemType.ARMOR) and gearItem == nil) then
                        gearItem  = item;
                    elseif(itemMap[itemId] ~= nil)  then
                        augItemId = itemId;
                    elseif(nmDropItem[itemId] ~= nil) then
                        nmItemId = itemId;
                    end
                end
            end
            
            if (gearItem) then
                local slotType = gearItem:getSlotType()
                local skillType = gearItem:getSkillType()
                
                local augmentList, maxTier = getAugmentList(slotType, augmentType, augmentSlot, gearItem)
                local augmentId, augmentValue = gearItem:getAugment(augmentIdx);
                local currentAugTier = 0
                
                if (augmentId > 0) then
                    local augment = checkForMatchingAugId(augmentList, augmentId, skillType)
                    if augment then
                        if augment.Max then
                            maxTier = augment.Max
                        end
                        
                        if (augments[augmentId].BaseValue ~= nil) then
                            augmentValue = augmentValue + augments[augmentId].BaseValue;
                        end
                        
                        currentAugTier = math.floor(augmentValue / augment.Multiplier)-- zero indexed
                        if (augmentValue % augment.Multiplier ~= 0 or augment.Multiplier == 1) then
                            currentAugTier = currentAugTier + 1
                        end
                        
                        if (currentAugTier < maxTier) then
                            if (nmItemId and nmItemId == nmDropItem[currentAugTier] and tradeGil == augCost[currentAugTier]) then
                                trade:confirmSlot(0,tradeGil)
                                trade:confirmItem(nmItemId,1)
                                
                                local gearId = gearItem:getID()
                                local quantity = trade:getItemQty(gearId)
                                trade:confirmItem(gearId,quantity)
                                
                                augmentItem(player, npc, gearItem, quantity, augmentIdx, augment, currentAugTier) -- AUGMENT THAT SHIT!!!
                            else
                                player:PrintToPlayer("If you want to further enhance this item, you must provide the item and Gil I asked for.", 0, npcName);
                            end
                        else
                            player:PrintToPlayer("I cannot enhance this further.", 0, npcName);
                            printCannotDoAnything(player, npc, augmentId)
                        end
                    else
                        printCannotDoAnything(player, npc, augmentId)
                    end
                else
                    if (augItemId and itemMap[augItemId] and nmItemId and nmItemId == nmDropItem[currentAugTier] and tradeGil == augCost[currentAugTier]) then
                        -- NEED TO IMPLEMENT
                        local itemIndex
                        for k, v in pairs(itemMap) do
                            if tonumber(v) and v == augItemId then
                                itemIndex = k+1
                            end
                        end
                        
                        if itemIndex ~= nil then
                            local augment = getAugmentByIndex(augmentList, itemIndex, skillType)
                            
                            if augment then
                                if augment.Max then
                                    maxTier = augment.Max
                                end
                                
                                trade:confirmSlot(0,tradeGil)
                                
                                trade:confirmItem(augItemId,1)
                                trade:confirmItem(nmItemId,1)
                                
                                local gearId = gearItem:getID()
                                local quantity = trade:getItemQty(gearId)
                                trade:confirmItem(gearId,quantity)
                                
                                augmentItem(player, npc, gearItem, quantity, augmentIdx, augment, currentAugTier) -- AUGMENT THAT SHIT!!!
                            else
                                player:PrintToPlayer("If you want to begin the enhancement process you must provide the items I asked for.", 0, npcName);
                            end
                        end
                    else
                        player:PrintToPlayer("If you want to begin the enhancement process you must provide the items and Gil I asked for.", 0, npcName);
                    end
                end
            else
                player:PrintToPlayer("The entire point of this is to enhance equipment. You failed to give me your gear.", 0, npcName);
            end
        else
            player:PrintToPlayer("This is not charity. Come back when you have money...", 0, npcName);
        end
    elseif (trade:getSlotCount() == 2) then
        local tradeGil = trade:getGil();
        if tradeGil == 12345 then
            local gearItem;
            for i = 1, 8 do
                local itemId = trade:getItemId(i);
                if (itemId > 0) then
                    local item = trade:getItem(i);
                    if (item:isType(tpz.itemType.ARMOR) and gearItem == nil) then
                        gearItem  = item;
                    end
                end
            end
            
            if (gearItem) then
                trade:confirmSlot(0,tradeGil)
                local gearId = gearItem:getID()
                local quantity = trade:getItemQty(gearId)
                trade:confirmItem(gearId,quantity)
                
                removeAugment(player, npc, gearItem, quantity, augmentIdx)
            end
        end
    end
end

function handleOnTrigger(player,npc)
    local npcId = npc:getID();
    local npcName = npc:getName():gsub("_"," ")
    local message = "";

    if (npcId >= 17719917 and npcId <= 17719920) then
        message = message .. "We can embue your equipment with martial enhancements."
    elseif (npcId >= 17727673 and npcId <= 17727678) then
        message = message .. "We can embue your equipment with ranged enhancements."
    elseif (npcId >= 17736005 and npcId <= 17736012) then
        message = message .. "We can embue your equipment with magical enhancements."
    elseif (npcId >= 17756444 and npcId <= 17756447) then
        message = message .. "We can embue your equipment with pet enhancements."
    end

    if (message ~= "") then
        message = message .. string.format(" My specialty Augment slot %s.", npcMap[npcId].AugIdx)
        player:PrintToPlayer(message, 0, npcName);
    end
    
    message = "For a price, a simple rare trinket, and a silly rabbit's Egg we can enhance your equipment."
    player:PrintToPlayer(message, 0, npcName);
    
    message = "Let me have a closer look at a piece of your equipment and we can discuss what I can do for you."
    player:PrintToPlayer(message, 0, npcName);
end

function removeAugment(player, npc, gearItem, quantity, augmentIdx)
    local gearId = gearItem:getID()
    local augTable = {}
    
    for i = 0, 3 do
        local augId, augVal = gearItem:getAugment(i);
        augTable[i] = {Id = augId, Val = augVal}
    end

    augTable[augmentIdx] = {Id = 0, Val = 0}
    
    player:confirmTrade();
    player:addItem(gearId, quantity, augTable[0].Id, augTable[0].Val, augTable[1].Id, augTable[1].Val, augTable[2].Id, augTable[2].Val, augTable[3].Id, augTable[3].Val);
    player:PrintToPlayer("Pleasure doing buisiness with you.", 0, npcName);
    player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, gearId);
end

function augmentItem(player, npc, gearItem, quantity, augmentIdx, augment, newAugTier)
    local npcName = npc:getName():gsub("_"," ")
    local gearId = gearItem:getID()
    
    local augTable = {}
    
    for i = 0, 3 do
        local augId, augVal = gearItem:getAugment(i);
        augTable[i] = {Id = augId, Val = augVal}
    end
    
    local augmentId = augment.AugId
    local multiplier = augment.Multiplier
    local baseValue = 1
    if (augments[augmentId].BaseValue) then
        baseValue = augments[augmentId].BaseValue
    end
    
    local nextId = nil
    if (augments[augmentId].NextAugId) then
        nextId = augments[augmentId].NextAugId
    end
    
    if (nextId and augments[nextId].BaseValue <= (newAugTier+1) * multiplier) then
        augmentId = nextId
        baseValue = augments[nextId].BaseValue
    end
    
    local augmentValue = (newAugTier+1) * multiplier - baseValue
    augTable[augmentIdx] = {Id = augmentId, Val = augmentValue}
    
    player:confirmTrade();
    player:addItem(gearId, quantity, augTable[0].Id, augTable[0].Val, augTable[1].Id, augTable[1].Val, augTable[2].Id, augTable[2].Val, augTable[3].Id, augTable[3].Val);
    player:PrintToPlayer("Pleasure doing buisiness with you.", 0, npcName);
    player:messageSpecial(zones[player:getZoneID()].text.ITEM_OBTAINED, gearId);
end

function getAugmentList(slotType, augmentType, augmentSlot, item)
    local returnList;
    local maxTier = 10;
    
    local augmentList = augmentMap[slotType]
    if (augmentList["Max"]) then
        maxTier = augmentList["Max"]
    end
    
    if (augmentList[augmentType]) then
        augmentList = augmentList[augmentType]
        if (isTable(augmentList) and augmentList["Max"]) then
            maxTier = augmentList["Max"]
        end
        
        local skill = item:getSkillType()
        local subSkill = item:getSubSkillType()
        
        if (slotType == tpz.slot.SUB) then
            if (item:isShield() and augmentList["Shield"]) then
                augmentList = augmentList["Shield"]
            elseif (skill == 0 and augmentList["Grip"]) then
                augmentList = augmentList["Grip"]
            end
        elseif (slotType == tpz.slot.RANGED) then
            if (subSkill == 10 and augmentList["Animator"]) then
                augmentList = augmentList["Animator"]
            elseif (skill >= 40 and skill <= 42 and augmentList["Instrument"]) then
                augmentList = augmentList["Instrument"]
            end
        end
        if (isTable(augmentList) and augmentList["Max"]) then
            maxTier = augmentList["Max"]
        end
        
        if (augmentList[augmentSlot]) then
            augmentList = augmentList[augmentSlot]
            if (isTable(augmentList) and augmentList["Max"]) then
                maxTier = augmentList["Max"]
            end
            
            returnList = augmentList
        end
    end
    
    return returnList, maxTier
end

function loopAugments(list, skill, success)
    local found
    local tmpList = deepcopy(list)
    if (not isTable(tmpList)) then
        tmpList = {tmpList}
    end
    
    local multiplier = 1
    if (tmpList["Multiplier"]) then
        multiplier = tmpList["Multiplier"]
    end
    
    local maxTier
    if (tmpList["Max"]) then
        maxTier = tmpList["Max"]
    end
    
    if(skill and tmpList[skill]) then
        table.insert(tmpList, tonumber(tmpList[skill]))
    end
    
    for k, v in sorted_iter(tmpList) do
        if isTable(v) then
            local tmp = loopAugments(v)
            if (tmp) then
                found = tmp; break;
            end
        elseif success(k, v) then
            found = {AugId = tonumber(v), Multiplier = multiplier, Max = maxTier}; break;
        end
    end
    
    return found
end

function getAugmentByIndex(augmentList, itemIndex, skillType)
    local skill = skillMap[skillType]
    local tmpIndex = 0
    
    local success = function(k, v)
        if tonumber(k) and tonumber(v) then
            tmpIndex = tmpIndex + 1
            return itemIndex == tmpIndex
        end
        return false
    end
        
    return loopAugments(augmentList, skill, success)
end

function checkForMatchingAugId(augmentList, augmentId, skillType)
    local skill = skillMap[skillType]
    
    local tmpAugId = augmentId
    if (tierIds[augmentId]) then
        tmpAugId = tierIds[augmentId]
    end
    
    local success = function(k, v)
        return tonumber(k) and tonumber(v) == tmpAugId
    end
    
    return loopAugments(augmentList, skill, success)
end

function sayAugmentOptions(augmentList, player, npc, skillType)
    local npcName = npc:getName():gsub("_"," ")
    local skill = skillMap[skillType]
    
    player:PrintToPlayer(string.format("Here's what I can do for you. Bring me %s Gil and a %s, and one of the following items to choose your augment.", augCost[0], nmDropItem[nmDropItem[0]]), 0, npcName);

    local loopAugments
    loopAugments = function(list)
        local tmpList = deepcopy(list)
        if (not isTable(tmpList)) then
            tmpList = {tmpList}
        end
        
        local multiplier = 1
        if (tmpList["Multiplier"]) then
            multiplier = tmpList["Multiplier"]
        end
        
        if(skill and tmpList[skill]) then
            table.insert(tmpList, tonumber(tmpList[skill]))
        end
    
        for k, v in sorted_iter(tmpList) do
            if isTable(v) then
                loopAugments(v)
            elseif (tonumber(k)) then
                player:PrintToPlayer(string.format("     %s: %s",getAugItemFromIndex(k-1), string.format(augments[v].Description,multiplier)), 0, npcName);
            end
        end
    end
    
    loopAugments(augmentList)
    printCannotDoAnything(player, npc, 1)
end;

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function isTable(element)
    return type(element) == "table"
end

function getAugItemFromIndex(idx)
    local found = -1
    if itemMap[idx] and itemMap[itemMap[idx]] then
        found = itemMap[itemMap[idx]]
    end
    return found
end

function getNMItemFromIndex(idx)
    local found = -1
    if nmDropItem[idx] and nmDropItem[nmDropItem[idx]] then
        found = nmDropItem[nmDropItem[idx]]
    end
    return found
end

function printCannotDoAnything(player, npc, augmentId)
    local npcName = npc:getName():gsub("_"," ")
    if augmentId > 0 then
        player:PrintToPlayer(string.format("If you wish to remove an augment in slot %s, trade me your equipment and a %s Gil removal fee.", npcMap[npc:getID()].AugIdx, augCost["RemovalFee"]), 0, npcName);
    else
        player:PrintToPlayer("I cannot do anything with this.", 0, npcName)
    end
end

function sorted_iter(t)
  local i = {}
  for k in next, t do
    table.insert(i, k)
  end
  table.sort(i, 
    function(a,b)
      if tonumber(a) and tonumber(b) then
        return a<b
      else
        return tostring(a)<tostring(b)
      end
    end)
  return function()
    local k = table.remove(i,1)
    if k ~= nil then
        return k, t[k]
    end
  end
end