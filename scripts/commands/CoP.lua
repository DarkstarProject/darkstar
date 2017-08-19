---------------------------------------------------------------------------------------------------
-- func: CoP Content Items
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
    player:PrintToPlayer("Welcome to BNET.cc's shop of CoP wares to aid you on your adventure!", 0xF);
stock = {
        -- Homan
        15240, 10000000, -- Homan Zucchetto
        14488, 10000000, -- Homan Corazza
        14905, 10000000, -- Homan Manopolas
        15576, 10000000, -- Homan Cosciales
        15661, 10000000, -- Homan Gambieras
        -- Nashira
        15241, 10000000, -- Nashira Turban
        14489, 10000000, -- Nashira Manteel
        14906, 10000000, -- Nashira Gages
        15577, 10000000, -- Nashira Seraweels
        15662, 10000000, -- Nashira Crackows
        -- Shedir
        10441, 10000000, -- Shedir Turban
        10279, 10000000, -- Shedir Manteel
        10323, 10000000, -- Shedir Gages
        10329, 10000000, -- Shedir Seraweels
        10370, 10000000, -- Shedir Crackows
        -- Enif
        10438, 10000000, -- Enif Zucchetto
        10276, 10000000, -- Enif Corazza
        10320, 10000000, -- Enif Manopolas
        10326, 10000000, -- Enif Cosciales
        10367, 10000000, -- Enif Gambieras
        -- Adhara
        10439, 10000000, -- Adhara Turban
        10277, 10000000, -- Adhara Manteel
        10321, 10000000, -- Adhara Gages
        10327, 10000000, -- Adhara Seraweels
        10368, 10000000, -- Adhara Crackows
        -- Murzim
        10440, 10000000, -- Murzim Zucchetto
        10278, 10000000, -- Murzim Corazza
        10322, 10000000, -- Murzim Manopolas
        10328, 10000000, -- Murzim Cosciales
        10369, 10000000, -- Murzim Gambieras
        15962, 7000000, -- Static Earring
        15963, 7000000, -- Magnetic Earring
        15964, 7000000, -- Hollow Earring
        15965, 7000000, -- Ethereal Earring
        15543, 7000000, -- Rajas Ring
        15544, 7000000, -- Sattva Ring
        15545, 7000000, -- Tamas Ring
        18360, 15000000, -- Faith Baghnakhs
        15512, 7000000, -- Faith Torque
        18222, 15000000, -- Fortitude Axe
        15511, 7000000, -- Fortitude Torque
        17595, 15000000, -- Hope Staff
        15509, 7000000, -- Hope Torque
        17710, 15000000, -- Justice Sword
        15508, 7000000, -- Justice Torque
        18100, 15000000, -- Love Halberd
        15514, 7000000, -- Love Torque
        18397, 15000000, -- Prudence Rod
        15510, 7000000, -- Prudence Torque
        17948, 15000000, -- Temperance Axe
        15513, 7000000, -- Temperance Torque
        15458, 10000000, -- Ninurta's Sash
        17810, 15000000, -- Futsuno Mitama
        17598, 15000000, -- Bahamut's Staff
        18061, 15000000, -- Bahamut's Zaghnal
        10838, 10000000, -- Patentia Sash
        28013, 10000000, -- Hegira Wristbands
        27868, 10000000, -- Ischemia Chasuble
        28155, 10000000, -- Scuffler's Cosciales
        28449, 10000000, -- Metalsinger Belt
        28505, 7000000, -- Domesticator's Earring
        21371, 15000000, -- Ginsen
        21227, 15000000, -- Hangaku-no-Yumi
        27719, 10000000, -- Sukeroku Hachimaki
        28292, 10000000, -- Battlecast Gaiters
        28379, 7000000, -- Mizukage-no-Kubikazari
        21170, 15000000, -- Nilgal Pole
        20991, 15000000, -- Chidori
        28445, 10000000, -- Shetal Stone
        27708, 10000000, -- Baghere Salade
        28287, 10000000, -- Durgai Leggings
        20516, 10000000, -- Denouements
        26400, 10000000, -- Culminus
        25634, 10000000, -- Terminal Helm
        25707, 10000000, -- Terminal Plate
        27541, 7000000, -- Cessance Earring
        26000, 7000000, -- Consummation Torque
        20698, 15000000, -- Fettering Blade
        22118, 15000000, -- Venery Bow
        25708, 10000000, -- Gyve Doublet
        27324, 10000000, -- Gyve Trousers
        27618, 10000000, -- Laic Mantle
        26324, 10000000, -- Latria Sash
        20615, 15000000, -- Levante Dagger
        20808, 15000000, -- Tramontane Axe
        28538, 7000000, -- Lebeche Ring
        28441, 10000000, -- Ponente Sash
        28286, 10000000, -- Ostro Greaves
        21166, 15000000, -- Staccato Staff
        21274, 15000000, -- Donar Gun
        28354, 7000000, -- Voltsurge Torque
        28432, 10000000, -- Ukko Sash
        28142, 10000000, -- Brontes Cuisses
        21102, 15000000, -- Mafic Cudgel
        20757, 15000000, -- Foreshock Sword
        28535, 7000000, -- Supershear Ring
        20716, 15000000, -- Perfervid Sword
        21036, 15000000, -- Atakigiri
        28285, 10000000, -- Coalrake Sabots
        27594, 10000000, -- Annealed Mantle
        21421, 15000000, -- Immolation Grip
        20944, 15000000, -- Pelagos Lance
        21103, 15000000, -- Vadose Rod
        20856, 15000000, -- Phreatic Axe
        21420, 15000000, -- Benthos Grip
        28493, 7000000, -- Neritic Earring
        20529, 15000000, -- Calved Claws
        21167, 15000000, -- Frazil Staff
        28495, 7000000, -- Rimeice Earring
        28008, 10000000, -- Nilas Gloves
        21366, 7000000, -- Floestone
        21412, 15000000, -- Capitoline Strap
        20707, 15000000, -- Medeina Kiliji
        26969, 10000000, -- Vrikodara Jupon
        25600, 10000000, -- Ma'iitsoh Haube
        27608, 10000000, -- Lupine Cape
        21155, 15000000, -- Marquetry Staff
        28414, 10000000, -- Engraved Belt
        26970, 10000000, -- Lapidary Tunic
        27516, 7000000, -- Satlada Necklace
        27466, 10000000, -- Diamantaire Sollerets
        20982, 15000000, -- Shuhansadamune
        27531, 7000000, -- Darkside Earring
        10767, 7000000, -- Pernicious Ring
        26971, 10000000, -- Chozoron Coselete
        27105, 10000000, -- Loagaeth Cuffs
    }

showShop(player, STATIC, stock);
end