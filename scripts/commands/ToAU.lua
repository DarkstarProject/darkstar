---------------------------------------------------------------------------------------------------
-- func: ToAU Content Items
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
    player:PrintToPlayer("Welcome to BNET.cc's shop of ToAU  wares to aid you on your adventure!", 0xF);
stock = {
        -- Askar
        16106, 10000000, -- Askar Zucchetto
        14568, 10000000, -- Askar Korazin
        14983, 10000000, -- Askar Manopolas
        15647, 10000000, -- Askar Dirs
        15733, 10000000, -- Askar Gambieras
        -- Phorcys
        10901, 10000000, -- Phorcys Salade
        10474, 10000000, -- Phorcys Korazin
        10523, 10000000, -- Phorcys Mitts
        10554, 10000000, -- Phorcys Dirs
        10620, 10000000, -- Phorcys Schuhs
        -- Denali
        16107, 10000000, -- Denali Bonnet
        14569, 10000000, -- Denali Jacket
        14984, 10000000, -- Denali Wristbands
        15648, 10000000, -- Denali Kecks
        15734, 10000000, -- Denali Gamashes
        -- Thaumas
        10906, 10000000, -- Thaumas Hat
        10479, 10000000, -- Thaumas Coat
        10528, 10000000, -- Thaumas Gloves
        10559, 10000000, -- Thaumas Kecks
        10625, 10000000, -- Thaumas Nails
        -- Goliard
        16108, 10000000, -- Goliard Chapeau
        14570, 10000000, -- Goliard Saio
        14985, 10000000, -- Goliard Cuffs
        15649, 10000000, -- Goliard Trews
        15735, 10000000, -- Goliard Clogs
        -- Nares
        10911, 10000000, -- Nares Cap
        10484, 10000000, -- Nares Saio
        10533, 10000000, -- Nares Cuffs
        10564, 10000000, -- Nares Trews
        10630, 10000000, -- Nares Clogs
        -- Ares'
        16084,10000000, -- Ares' Mask
        14546,10000000, -- Ares' Cuirass
        14961,10000000, -- Ares' Gauntlets
        15625,10000000, -- Ares' Flanchard
        15711,10000000, -- Ares' Sollerets
        -- Ares' +1
        27648,10000000, -- Ares' Mask
        27788,10000000, -- Ares' Cuirass
        27928,10000000, -- Ares' Gauntlets
        28071,10000000, -- Ares' Flanchard
        28208,10000000, -- Ares' Sollerets

        -- Skadi's
        16088,10000000, -- Skadi's Visor
        14550,10000000, -- Skadi's Cuirie
        14965,10000000, -- Skadi's Bazubands
        15629,10000000, -- Skadi's Chausses
        15715,10000000, -- Skadi's Jambeaux
        -- Skadi's +1
        27649,10000000, -- Skadi's Visor
        27789,10000000, -- Skadi's Cuirie
        27929,10000000, -- Skadi's Bazubands
        28072,10000000, -- Skadi's Chausses
        28209,10000000, -- Skadi's Jambeaux
        -- Usukane
        16092,10000000, -- Usukane Somen
        14554,10000000, -- Usukane Haramaki
        14969,10000000, -- Usukane Gote
        15633,10000000, -- Usukane Hizayoroi
        15719,10000000, -- Usukane Sune-Ate
        -- Usukane +1
        27650,10000000, -- Usukane Somen
        27790,10000000, -- Usukane Haramaki
        27930,10000000, -- Usukane Gote
        28073,10000000, -- Usukane Hizayoroi
        28210,10000000, -- Usukane Sune-Ate

        -- Marduk's
        16096,10000000, -- Marduk's Tiara
        14558,10000000, -- Marduk's Jubbah
        14973,10000000, -- Marduk's Dastanas
        15637,10000000, -- Marduk's Shalwar
        15723,10000000, -- Marduk's Crackows
        -- Marduk's +1
        27651,10000000, -- Marduk's Tiara
        27791,10000000, -- Marduk's Jubbah
        27931,10000000, -- Marduk's Dastanas
        28074,10000000, -- Marduk's Shalwar
        28211,10000000, -- Marduk's Crackows
        -- Morrigan
        16100,10000000, -- Morrigan Coronal
        14562,10000000, -- Morrigan Robe
        14977,10000000, -- Morrigan Cuffs
        15641,10000000, -- Morrigan Slops
        15727,10000000, -- Morrigan Pigaches
        -- Morrigan +1
        27652,10000000, -- Morrigan Coronal
        27792,10000000, -- Morrigan Robe
        27932,10000000, -- Morrigan Cuffs
        28075,10000000, -- Morrigan Slops
        28212,10000000, -- Morrigan Pigaches
		-- 15015, 15000000, -- Hachiryu Kote
		-- 11281, 5000000, -- Hachiryu Haramaki
		-- 16337, 5000000, -- Hachiryu Haidate
		-- 11364, 5000000, -- Hachiryu Sune-ate
		-- 18594, 15000000, -- Dorje
		-- 18447, 5000000, -- Nanatsusaya
		-- 18759, 5000000, -- Shenlong's Baghnakhs
		-- 18593, 5000000, -- Alkalurops
		-- 18857, 15000000, -- Antares
		-- 17753, 15000000, -- Organics
		-- 16175, 15000000, -- Muse Tariqah 
		-- 16239, 5000000, -- Solitaire Cape
		-- 16268, 5000000, -- Kubira Bead Necklace
		-- 15799, 7000000, -- Iota ring
		-- 15800, 7000000, -- Omega Ring
		-- 17745, 5000000, -- Hofud
		-- 18916, 5000000, -- Heimdall's Doom
		-- 14577, 15000000, -- Valhalla Breastplate
		-- 10280, 15000000, -- Laeradr Breastplate
		-- 16117, 15000000, -- Valhalla Helm
		-- 10442, 5000000, -- Laeradr Helm
		-- 18121, 5000000, -- Valkyrie's Folk
		-- 19799, 5000000, -- Herja's Folk
		-- 21368, 15000000, -- Bestas Bane
		-- 27862, 5000000, -- Savas Jawshan
		-- 28151, 5000000, -- Sifahir Slacks
		-- 27710, 5000000, -- Sahip Helm
		-- 28498, 7000000, -- Pratik Earring
		-- 27709, 15000000, -- Ptica Headgear
		-- 27861, 15000000, -- Karmesin Vest
		-- 28288, 5000000, -- Kandza Crackows
		-- 21367, 5000000, -- Tengu-no-Hane
		-- 28448, 5000000, -- Tengu-no-Obi
    }

showShop(player, STATIC, stock);
end