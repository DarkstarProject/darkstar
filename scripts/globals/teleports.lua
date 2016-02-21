-----------------------------------
-- A collection of frequently needed teleport shortcuts.
-- by ReaperX
-- Coordinates marked {R} have been obtained by packet capture from retail. Don't change them.
-----------------------------------

-----------------------------------
-- TELEPORT NAMES
-----------------------------------
TELEPORT_DEM           = 1;
TELEPORT_HOLLA         = 2;
TELEPORT_YHOAT         = 3;
TELEPORT_VAHZL         = 4;
TELEPORT_MEA           = 5;
TELEPORT_ALTEP         = 6;
TELEPORT_WARP          = 7;
TELEPORT_ESCAPE        = 8;
RECALL_JUGNER          = 9;
RECALL_PASHH           = 10;
RECALL_MERIPH          = 11;
FIREFLIES_AZOUPH       = 12;
FIREFLIES_BHAFLAU      = 13;
FIREFLIES_ZHAYOLM      = 14;
FIREFLIES_DVUCCA       = 15;
FIREFLIES_REEF         = 16;
FIREFLIES_ALZADAAL     = 17;
FIREFLIES_CUTTER       = 18;
FIREFLIES_Z_REM        = 19;
FIREFLIES_A_REM        = 20;
FIREFLIES_B_REM        = 21;
FIREFLIES_S_REM        = 22;
TELEPORT_MAAT          = 23;
TELEPORT_HOMING        = 24;
TELEPORT_TO_LEADER     = 25;
TELEPORT_EXITPROMMEA   = 26;
TELEPORT_EXITPROMHOLLA = 27;
TELEPORT_EXITPROMDEM   = 28;
TELEPORT_LUFAISE       = 29;
-----------------------------------
-- Teleports
-----------------------------------
function toLeader(player) -- No logical order in this file, so tossing my entry at top! SO THERE!
    local leader = player:getPartyLeader();
    local X = leader:getXPos();
    local Y = leader:getYPos();
    local Z = leader:getZPos();
    local Rot = leader:getRotPos();
    local Zone = leader:getZoneID();
    player:setPos(X, Y, Z, Rot, Zone);
end;

function toFeiYin(player)
    player:setPos(280, 20, 543, 192, 0x6F);
end;

function toQuHauSpring(player)
    player:setPos(0,-30,60,192,0x7A);
end;

function toMhaura(player)
    player:setPos(0,-8,41,64,0xF9);
end;

function toBatalliaDowns(player)
    player:setPos(180,8,-420,167,0x69); -- to main entrance of the Eldieme Necropolis.
end;

function toThroneRoom(player)
    player:setPos(72, -4, 0, 128, 0xA5);
end;

function toRuLudeEmbassyArea(player)
    player:setPos(0, 7, -23, 63, 0xF3);
end;

function toOrastery(player)
    player:setPos(-108, -3, 105, 90, 0xF0);  -- to Port Windurst Orastery
end;

function toOptistery(player)
    player:setPos(-27, -5, 101, 172, 0xEE);  -- to Tosuka - Porika (Optistery)
end;

function toAurastery(player)
    player:setPos(170, -1.2, 160, 87, 0xEE); -- to Moreno-Toeno (Aurastery)
end;

function toManustery(player)
    player:setPos(-14, -3, 14, 221, 0xF1);   -- to Apururu (Manustery)
end;

function toRhinostery(player)
    player:setPos(-5, -4, -182, 252, 0xEE);
end;

function toAnimastery(player)
    player:setPos(62, 20, -59, 223, 0xA9); -- to Toraimarai Canal
end;

function toStarSibyl(player)
    player:setPos(2, -45, -28, 180, 0xF2);   -- to Star Sibyl chamber, Heaven's Tower
end;

function toHeavensTower(player)
    player:setPos(0, 0, -14, 192, 0xF2); -- to entrance (first?) floor of Heaven's Tower.
end;

function toLeepeHoppe(player)
    player:setPos(17, -10, -200, 139, 0xEE);
end;

function toFullMoonFountain(player)
    player:setpos(-260, 4, -325, 192, 0xAA);
end;

function toRukususu(player)
    player:setPos(-193,0,190,128,0xCC); -- to Rukususu @ Fei'Yin
end;

function toShantotto(player)
    player:setPos(121, -3, 113, 212, 0xEF);  -- to Shantotto
end;

function toLilyTower(player)
    player:setPos(362, -13, 100, 0, 0x74); -- to J-7 in East Saru, entrance "5" to Inner Horutoto Ruins.
end;

function toMargueriteTower(player)
    player:setPos(259, -18, -432, 61, 0x74); -- to J-11 in East Saru, entrance "4" to Outer Horutoto Ruins.
end;

function toRoseTower(player)
    player:setPos(-259, 0, 100, 192, 0xC0); -- to H-7 Inner Horutoto Ruins, behind 3 Mages' Gate, room with elemental gates.
end;

function toDahliaTower(player)
    player:setPos(-300, 0, -660, 255, 0xC2); -- this is the SW tower in West Saru at F-11 that's filled with Cardians.
end;

function toAmaryllisTower(player)
    player:setPos(-421, 0, 620, 128, 0xC2); -- to Outer Horutoto Ruins, NW tower,G-8
end;

function toCatBurglar(player)
    player:setPos(60,-5,239,0,0xF1); -- to Nanaa Mihgo
end;

function toPerihVashai(player)
    player:setPos(118,-4,98,66,0xF1); -- to RNG quest NPC
end;

function toCatBurglarsHideout(player)
    player:setPos(-5, 0, 21, 128, 0xC0); -- to G-8 in Inner Horutoto Ruins, Beetle's Burrow, in front of Mahagony Door.
end;

function toHouseOfTheHero(player)
    player:setPos(-26, -12, 253, 194, 0xEF); -- to the House of the Hero, G-4 Windurst Walls.
end;

function toKupipi(player)
    player:setPos(0, 0, 28, 206, 0xF2);
end;

function toZubaba(player)
    player:setPos(13, -26.25, 15, 222, 0xf2) -- to Zubaba in Heaven's Tower.
end;

function toPurgonorgo(player)
    player:setPos(522, -3, 545, 65, 0x2C)  -- to Abdhaljs Purgonorgo Isle
end;

function toPurgonorgoBibiki(player)
    player:setPos(-382, -2, -428, 190, 0x04)  -- to Purgonorgo Isle (bibiki bay)
end;

function toWindurstMissionOverseer(player)
    local which = player:getVar("firstmissionguard");
    if (which == 1) then
        player:setPos(0, -16, 122, 198, 0xEF); -- Zokima-Rokima in Windurst Walls
    elseif (which == 2) then
        player:setPos(107, -5, -24, 248, 0xF1); -- Rakoh Buuma in Windurst Woods
    end;
end;


function toRomaaMigho(player)
    player:setPos(29, -12, -174, 68, 0xFA); -- to H-11 in Kazham (Migho's Residence)
end;

function toCathedral(player)
    player:setPos(148, 0, 139, 220, 0xE7);    -- to Arnau in the San d'Oria Cathedral
end;

function toChateaudOraguille(player)
    player:setPos(0, 0, 0, 192, 0xE9);
end;
function toMaat(player)
    player:setPos(11, 3, 117, 0, 243);
end;

function toGhelsba(player)
    player:setPos(-156, -10, 80, 119, 0x8C); -- to the BCNM hut in Ghelsba Outpost.
end;

function toDrogarogasSpine(player)
    player:setPos(644,-16,0,185,0x77);    -- to eastern portion of Drogaroga's Spine in Meriphataud Mountains.
end;

function toHallofTransferenceDem(player)
    player:setPos(-267.194, -40.634, -280.019, 0, 0xE); -- {R}
end;

function toHallofTransferenceHolla(player)
    player:setPos(-266.76, -0.6337, 280.058, 0, 0xE); -- {R}
end;

function PromyvionHollaExitPosition(player)
    player:setPos(-225.682, -6.4595, 280.002, 128, 0xE); -- {R}
end;

function PromyvionHollaEntryPosition(player)
    player:setPos(92.033, 0, 80.38, 255, 0xE); -- {R}
end;

function toHallofTransferenceMea(player)
    player:setPos(280.066, -80.63337, -67.096, 192, 0xE); -- {R}
end;

function toSelbina(player)
    player:setPos(-57.329,-0.959,-45.690,125,0xF8); --to Isacio for subjob quest
end;

function toWajaomPukCamp(player)  -- Just a camp just for puks \\ disregard
    player:setPos(-174.223,-20.132,-564.999,187,0x33);
end;

function toBalasiel(player) -- Teles to Balasiel
    player:setPos(-136.078,-10.800,63.500,162,0xE6);
end;

function toWaterLeaper(player) -- teleport to Water Leaper for Impulse Drive WSNM
    player:setPos(108.156,0.500,-121.639,775,0xB0);
end;

function toMiaux(player)  --- Teleport back to Miaux for DRG AF1 complete
    player:setPos(-170.509,4,159.737,7959,0xE7);
end;

function toAltepaDesert(player) -- Teleport to ??? for DRG AF1
    player:setPos(115.859,-7.916,-74.276,8076,0x72);
end;

function toMineShaft2716(player) -- Teleport to Mine Shaft 2716
    player:setPos(-93.657, -120.000, -583.561, 0, 13); -- (R)
end;

function toSkyGreenPorterLeft(player)
    player:setPos(-134.145, -32.328, -205.947, 215, 130); -- {R}
end;

function toPalaceEntrance(player)
    player:setPos(-31.8, 0, -618.7, 190, 33); -- to Palace Entrance in Al'Taieu (via Sueleen) {R}
end;

function toRuLudeGardens(player)
    player:setPos(-0.041, 2.999, -6.067, 192, 243); -- H-8  {R}
end;

function toWajaomLaypoint(player)  -- Wajaom Woodlands Laypoint
    player:setPos(-200.116, -10, 79.879, 213, 51); -- {R}
end;

function toAhtUrhganWhitegate(player)
    player:setPos(27.424, -6, -123.792, 192, 0x32); -- {R}
end;

-----------------------------------
-- Telepoint Crags
-----------------------------------

function toAltep(player)
    player:setPos(-61.942,3.949,224.9,0,0x72);         -- to Altep Telepoint {R}
end;

function toYhoat(player)
    player:setPos(-280.942,0.596,-144.156,0,0x7c);  -- to Yhoat Telepoint {R}
end;

function toVahzl(player)
    player:setPos(150.258,-21.048,-37.256,94,0x70); -- to Vahzl Teleport  {R}
end;

function toDem(player)
    player:setPos(220,19.104,300,0,0x6c);             -- Dem Telepoint       {R}
end;

function toHolla(player)
    player:setPos(420,19.104,20,0,0x66);             -- Holla Telepoint       {R}
end;

function toMea(player)
    player:setPos(100,35.1506,340,0,0x75);             -- Mea Telepoint       {R}
end;

-----------------------------------
-- Swirling Vortex
-----------------------------------

function toLufaiseMeadows(player) -- Teleport Valkurm Dunes > Lufaise Meadows
    player:setPos(458.847,7.999,5.519,72,24); -- {R}
end;

function toValkurmDunes(player)   -- Teleport Lufaise Meadows > Valkurm Dunes
    player:setPos(420.062,0,-199.904,87,103); -- {R}
end;

function toMisareauxCoast(player) -- Teleport Qufim Island > Misareaux Coast
    player:setPos(-118,-32,219,3,25); -- {R}
end;

function toQufimIsland(player)       -- Teleport Misareaux Coast > Qufim Island
    player:setPos(-436,-13.499,340.117,107,126); -- {R}
end;

-----------------------------------
-- Campaign NPC Teleport
-----------------------------------

function toCampaignDestination(player, option)

    if (option == 1) then
        player:setPos(205.973,-23.5875,-206.606, 167, 0x89);  -- Xarcabard [S] {R}
    elseif (option == 2) then
        player:setPos(-46.172,-60.1088,-38.487, 16, 0x88);       -- Beaucedine Glacier [S] {R}
    elseif (option == 3) then
        player:setPos(306.939, -1, -141.567, 173, 84);           -- Batallia Downs [S] {R}
    elseif (option == 4) then
        player:setPos(-4.701, 15.982, 235.996, 160, 91);       -- Rolanberry Fields [S] {R}
    elseif (option == 5) then
        player:setPos(-64.212, 7.625, -51.292, 192, 98);       -- Sauromugue Champaign [S] {R}
    elseif (option == 6) then
        player:setPos(60.617, -3.949, 56.658, 64, 82);           -- Jugner Forest [S] {R}
    elseif (option == 7) then
        player:setPos(504.088, 24.511, 628.36, 69, 90);       -- Pashhow Marshlands [S] {R}
    elseif (option == 8) then
        player:setPos(-447.084, 23.433, 586.847, 31, 0x61);   -- Meriphataud Mountains [S] {R}
    elseif (option == 9) then
        player:setPos(-77.817, -47.234, -302.732, 135, 0x53); -- Vunkerl Inlet [S] {R}
    elseif (option == 10) then
        player:setPos(314.335, -36.368, -12.2, 192,0x59);       -- Grauberg [S] {R}
    elseif (option == 11) then
        player:setPos(141.021, -45, 19.543, 0, 0x60);          -- Fort Karugo-Narugo [S] {R}
    elseif (option == 12) then
        player:setPos(183.297, -19.9714, -240.895, 2, 0x51);  -- East Ronfaure [S] {R}
    elseif (option == 13) then
        player:setPos(-441.332, 40, -77.986, 164, 0x58);       -- North Gustaberg [S] {R}
    elseif (option == 14) then
        player:setPos(-104.707, -21.838, 258.043, 237, 0x5f); -- West Sarutabaruta [S] {R}
    elseif (option == 15) then
        player:setPos(-98, 1, -41, 224, 0x50);                  -- Southern San d'Oria [S] {approximated from memory}
    elseif (option == 16) then
        player:setPos(-291, -10, -107, 212, 0x57);               -- Bastok Markets [S] {appoximated from memory}
    elseif (option == 17) then
        player:setPos(-31.442, -5, 129.202, 128, 0x5E);       -- Windurst Waters [S} {R}
    elseif (option == 18) then
        player:setPos(-194.095, 0, 30.009, 0, 0xA4);           -- Garlaige Citdadel [S] {R}
    elseif (option == 19) then
        player:setPos(59.213, -32.158, -38.022, 64, 0xAB);       -- Crawler's Nest [S] {R}
    elseif (option == 20) then
        player:setPos(294.35, -27.5, 19.947, 0, 0xAF);           -- The Eldieme Necropolis [S] {R}
    end;
end;

-----------------------------------
-- Cavernous Maws
-----------------------------------

function toMaw(player, option)
    if (option == 1) then         -- Batallia Downs [S]
        player:setPos(-51.486, 0.371, 436.972, 128, 84);        -- {R}
    elseif (option == 2) then    -- Batallia Downs
        player:setPos(-51.486, 0.371, 436.972, 128, 105);        -- {R}
    elseif (option == 3) then    -- Rolanberry Fields [S]
        player:setPos(-196.5, 7.999, 361.192, 225, 91);            -- {R}
    elseif (option == 4) then    -- Rolanberry Fields
        player:setPos(-196.5, 7.999, 361.192, 225, 110);        -- {R}
    elseif (option == 5) then    -- Sauromugue Champaign [S]
        player:setPos(366.858, 8.545, -228.861, 95, 98);        -- {R}
    elseif (option == 6) then    -- Sauromugue Champaign
        player:setPos(366.858, 8.545, -228.861, 95, 120);        -- {R}
    elseif (option == 7) then    -- West Sarutabaruta [S]
        player:setPos(2.628, -0.15, -166.562, 32, 95);            -- {R}
    elseif (option == 8) then    -- West Sarutabaruta
        player:setPos(2.628, -0.15, -166.562, 32, 115);            -- {R}
    elseif (option == 9) then    -- East Ronfaure [S]
        player:setPos(322.057, -60.059, 503.712, 64, 81);        -- {R}
    elseif (option == 10) then    -- East Ronfaure
        player:setPos(322.057, -60.059, 503.712, 64, 101);        -- {R}
    elseif (option == 11) then    -- North Gustaberg [S]
        player:setPos(469.697, -0.05, 478.949, 0, 88);            -- {R}
    elseif (option == 12) then    -- North Gustaberg
        player:setPos(469.697, -0.05, 478.949, 0, 106);            -- {R}
    elseif (option == 13) then    -- Jugner Forest [S]
        player:setPos(-116.093,-8.005,-520.041,0,82);            -- {R}
    elseif (option == 14) then    -- Jugner Forest
        player:setPos(-116.093,-8.005,-520.041,0,104);            -- {R}
    elseif (option == 15) then    -- Pashhow Marshlands [S]
        player:setPos(415.945,24.659,25.611,101,90);            -- {R}
    elseif (option == 16) then    -- Pashhow Marshlands
        player:setPos(415.945,24.659,25.611,101,109);            -- {R}
    elseif (option == 17) then    -- Meriphataud Mountains [S]
        player:setPos(595,-32,279.3,93,97);                        -- {R}
    elseif (option == 18) then    -- Meriphataud Mountains
        player:setPos(595,-32,279.3,93,119);                    -- {R}
    -- TODO: Abyessa Maws:
            --Tahrongi Canyon (H-12)
            --Konschtat Highlands (I-12)
            --La Theine Plateau (E-4)
            --Valkurm Dunes (I-9)
            --Jugner Forest (J-8)
            --Buburimu Peninsula (F-7)
            --South Gustaberg (J-10)
            --North Gustaberg (G-6)
            --Xarcabard (H-8)
    end;
end;

-----------------------------------
-- Recalls
-----------------------------------

function recallJugner(player)
    player:setPos(-122.862, 0, -163.154, 192, 0x52);    -- {R}
end;

function recallMeriph(player)
    player:setPos(305.989, -14.978, 18.96, 192, 0x61);  -- {R}
end;

function recallPashh(player)
    player:setPos(345.472, 24.28, -114.731, 99, 0x5A);  -- {R}
end;

-----------------------------------
-- Staging Points
-----------------------------------

function AzouphIsleStagingPoint(player)
    player:setPos(522.73, -28.009, -502.621, 161, 0x4f); -- to Caedarva Mire {R}
end;

function MamoolJaStagingPoint(player)
    player:setPos(-210.291, -11.5, -818.056, 255, 0x34); -- to Bhauflau Thickets {R}
end;

function HalvungStagingPoint(player)
    player:setPos(688.994, -23.96, 351.496, 191, 0x3d); -- to Mount Zhayolm {R}
end;

function IlrusiAtollStagingPoint(player)
    player:setPos(17.54, -7.25, 627.968, 254, 0x36); -- to Arrapago Reef {R}
end;

function DvuccaIsleStagingPoint(player)
    player:setPos(-265.632, -6, -29.472, 94, 0x4f); -- to Caedarva Mire {R}
end;

function NzyulIsleStagingPoint(player)
    player:setPos(222.798, -0.5, 19.872, 0, 0x48); -- to Alzadaal Undersea Ruins {R}
end;

function toChamberOfPassage(player)
    if (math.random(1,2) == 1) then
        player:setPos(133.4, 1.485, 47.427, 96, 0x32);  -- Aht Urhgan Whitegate Chamber of Passage Left  {R}
    else
        player:setPos(116.67, 1.485, 47.427, 32, 0x32); -- Aht Urhgan Whitegate Chamber of Passage Right {R}
    end
end;

-----------------------------------
-- Assaults
-----------------------------------

function PeriqiaExit(player)
    player:setPos(-252.715, -7.666, -30.64, 128, 79); -- Exit                        {R}
end;

function LebrosCavernExit(player)
    player:setPos(681.950, -24, 369.936, 64, 61); -- Exit                            {R}
end;

function MamoolJaTrainingExit(player)
    player:setPos(-172.863, -12.25, -801.021, 128, 52);  -- Exit                    {R}
end;

function LeujaoamSanctumExit(player)
    player:setPos(495.450, -28.25, -478.430, 32, 79); -- Exit                        {R}
end;

function IlrusiAtollExit(player)
    player:setPos(9.304,-7.376,620.133,0,54); -- Exit                                {R}
end;

function NyzulIsleExit(player)
    player:setPos(180,0,20,0,72); -- Exit                                            {R}
end;

-----------------------------------
-- Salvage
-----------------------------------
-- TODO: The rest

function SilverSeaRemnantsExit(player)
    player:setPos(580,0,500,192,72); -- Exit                                        {R}
end;

function BhaflauRemnantsExit(player)
    player:setPos(620,0,-260,64,72); -- Exit                                        {R}
end;

-----------------------------------
-- Explorer Moogle
-----------------------------------

function toExplorerMoogle(player,zone)
    if (zone == 231) then
        player:setPos(39.4, -0.2, 25, 253, zone);        -- Northern_San_d'Oria
    elseif (zone == 234) then
        player:setPos(76.82, 0, -66.12, 232, zone);        -- Bastok_Mines
    elseif (zone == 240) then
        player:setPos(185.6, -12, 223.5, 96, zone);        -- Port_Windurst
    elseif (zone == 248) then
        player:setPos(14.67, -14.56, 66.69, 96, zone);    -- Selbina
    elseif (zone == 249) then
        player:setPos(2.87, -4, 71.95, 0, zone);        -- Mhaura
    end
end;

-----------------------------------
-- Trial-Size Avatar Quest Teleports
-----------------------------------

function toCloisterOfGales(player)
    player:setPos(-374.919, 0.628, -386.774, 226, 201); -- Cloister of Gales (Garuda)     {R}
end;
function toCloisterOfStorms(player)
    player:setPos(540.853, -13.329, 511.298, 82, 202);  -- Cloister of Storms (Ramuh)     {R}
end;
function toCloisterOfFrost(player)
    player:setPos(550.403, 0.006, 584.82, 217, 203);    -- Cloister of Frost (Shiva)     {R}
end;
function toCloisterOfFlames(player)
    player:setPos(-716.461, 0.407, -606.661, 168, 207); -- Cloister of Flames (Ifrit)    {R}
end;
function toCloisterOfTremors(player)
    player:setPos(-540.269, 1.396, -509.8, 192, 209);   -- Cloister of Tremors (Titan)   {R}
end;
function toCloisterOfTides(player)
    player:setPos(570.294, 36.757, 546.895, 167, 211);  -- Cloister of Tides (Leviathan) {R}
end;

-----------------------------------------
-- Escape
-----------------------------------------

function Escape(player, zone)

    -- Ronfaure {R}
    if (zone == 139 or zone == 140 or zone == 141 or zone == 142) then         -- From Ghelsba Outpost, Fort Ghelsba, Yughott Grotto, Horlais Peak
        player:setPos(-720,-61,600,64,100);                                 -- To West Ronfaure at E-4
    elseif (zone == 167) then                                                 -- From Bostaunieux Oubliette
        player:setPos(-685,-30,18,0,100);                                     -- To West Ronfaure at F-8
    elseif (zone == 190) then                                                 -- From King Ranperre's Tomb
        player:setPos(203,-1,-521,192,101);                                 -- To East Ronfaure at H-11
    -- Valdeaunia {R}
    elseif (zone == 162 or zone == 161 or zone == 165) then                     -- From Castle Zvahl Keep, Castle Zvahl Baileys, Throne Room
        player:setPos(-414,-44,19,0,112);                                     -- To Xarcabard at G-7
    -- Norvallen {R}
    elseif (zone == 195) then                                                 -- From The Eldieme Necropolis
        player:setPos(382.398,7.314,-106.298,160,105);                         -- To Batallia Downs at F-8
    elseif (zone == 149 or zone == 150) then                                 -- From Davoi or Monastic Cavern
        player:setPos(-232,-8,-562,0,104);                                     -- To Jugner Forest at G-12
    -- Fauregandi {R}
    elseif (zone == 166) then                                                 -- From Ranguemont Pass
        player:setPos(803,-61,635,128,101);                                 -- To East Ronfaure at K-4
    elseif (zone == 9 or zone == 10) then                                    -- From Pso'Xja, The Shrouded Maw
        player:setPos(-427,-41,-422,0,111);                                 -- To Beaucedine Glacier at E-11
    elseif (zone == 204 or zone == 206 or zone == 203) then                     -- From Fei'Yin, Qu'Bia Arena, Cloister of Frost
        player:setPos(279,19,536,64,111);                                     -- To Beaucedine Glacier at J-5
    -- Derfland {R}
    elseif (zone == 197) then                                                 -- From Crawlers' Nest
        player:setPos(-356,-24,-763,192,110);                                 -- To Rolanberry Fields at F-13
    elseif (zone == 148 or zone == 147) then                                 -- From Qulun Dome, Beadeaux
        player:setPos(557,24,-385,192,109);                                 -- To Pashhow Marshlands at K-11
    -- Emptiness {R}
    elseif (zone == 16 or zone == 17) then                                    -- From Promyvion-Holla, Spire of Holla
        player:setPos(332,24,-148,96,102);                                     -- To La Theine Plateau at J-9
    elseif (zone == 18 or zone == 19) then                                    -- From Promyvion-Dem, Spire of Dem
        player:setPos(134,24,134,96,108);                                     -- To Konschtat Highlands at I-7
    elseif (zone == 20 or zone == 21) then                                    -- From Promyvion-Mea, Spire of Mea
        player:setPos(266,40,254,32,117);                                     -- To Tahrongi Canyon at J-6
    elseif (zone == 22 or zone == 23) then                                    -- From Promyvion-Vahzl, Spire of Vahzl
        player:setPos(-331,-100,128,32,111);                                 -- To Beaucedine Glacier at F-7
    -- Qufim Island {R}
    elseif (zone == 157 or zone == 158 or zone == 184 or zone == 179) then     -- From Delkfutt's Tower: Middle, Upper, Lower, Stellar Fulcrum
        player:setPos(-267,-20,320,0,126);                                     -- To Qufim Island at F-6
    -- Tu'Lia {R}
    elseif (zone == 177 or zone == 178 or zone == 180 or zone == 181) then    -- From Ve'Lugannon Palace, Shrine of Ru'Avitau, LaLoff Amphitheater, The Celestial Nexus
        player:setPos(0,-35,-472,192,130);                                     -- To Ru'Aun Gardens at H-11
    -- Li'Telor {R}
    elseif (zone == 153 or zone == 154 or zone == 202) then                     -- From The Boyahda Tree, Dragon's Aery, Cloister of Storms
        player:setPos(509.5,1,-575,128,121);                                 -- To The Sanctuary of Zi'Tah at K-12
    -- Aragonau {R}
    elseif (zone == 200) then                                                 -- From Garlaige Citadel
        player:setPos(-112,-24,-403,192,120);                                 -- To Sauromugue Champaign at H-10
    elseif (zone == 152 or zone == 151) then                                 -- From Altar Room, Castle Oztroja
        player:setPos(718,-31,-63,128,119);                                 -- To Meriphataud Mountains at L-8
    -- Kolshushu {R}
    elseif (zone == 213) then                                                 -- From Labyrinth of Onzozo
        player:setPos(447,18,191,32,118);                                     -- To Buburimu Peninsula at K-6
    elseif (zone == 198) then                                                 -- From Maze of Shakhrami
        player:setPos(446,46,481,128,117);                                     -- To Tahrongi Canyon at K-5
    -- Sarutabaruta {R}
    elseif (zone == 169 or zone == 192 or zone == 194 or zone == 170) then     -- From Toraimarai Canal, Inner Horutoto Ruins, Outer Horutoto Ruins, Full Moon Fountain
        player:setPos(366,-13,92,128,116);                                     -- To East Sarutabaruta at J-7
    elseif (zone == 145 or zone == 146) then                                 -- From Giddeus, Balgas Dais
        player:setPos(-360,-20,78,192,115);                                 -- To West Sarutabaruta at F-8
    -- Elshimo Uplands {R}
    elseif (zone == 159 or zone == 160 or zone == 163 or zone == 211) then     -- From Temple of Uggalepih, Den of Rancor, Sacrificial Chamber, Cloister of Tides
        player:setPos(298,-2,-445,192,124);                                 -- To Yhoator Jungle at J-11
    elseif (zone == 205 or zone == 207) then                                                 -- From Ifrit's Cauldron, Cloister of Flames
        player:setPos(91,-1,336,96,124);                                     -- To Yhoator Jungle at I-6
    -- Elshimo Lowlands {R}
    elseif (zone == 176) then                                                 -- From Sea Serpent Grotto
        player:setPos(-627,16,-427,192,123);                                -- To Yuhtunga Jungle at E-11
    -- Gustaberg {R}
    elseif (zone == 173) then                                                 -- From Korroloka Tunnel
        player:setPos(-75,-1,20,0,172);                                     -- To Zeruhn Mines at H-7
    elseif (zone == 191) then                                                 -- From Dangruf Wadi
        player:setPos(-564,38,-541,0,107);                                     -- To South Gustaberg at E-9
    elseif (zone == 143 or zone == 144) then                                    -- From Palborough Mines, Waughroon Shrine
        player:setPos(483,-31,1159,128,106);                                 -- To North Gustaberg at K-3
    -- Movalpolos {R}
    elseif (zone == 13 or zone == 12 or zone == 11) then                     -- From Mine Shaft 2716, Newton Movalpolos, Oldton Movalpolos
        player:setPos(448,-4,730,96,106);                                     -- To North Gustaberg at K-6
    -- Kuzotz {R}
    elseif (zone == 208 or zone == 168 or zone == 209) then                     -- From Quicksand Caves, Chamber of Oracles, Cloister of Tremors
        player:setPos(454,-11,-35,128,114);                                 -- To Eastern Altepa Desert at J-8
    -- Vollbow {R}
    elseif (zone == 174) then                                                 -- From Kuftal Tunnel
        player:setPos(-46,6,418,192,125);                                     -- To Western Altepa Desert at I-5
    elseif (zone == 212) then                                                 -- From Gustav Tunnel
        player:setPos(-791,-6,57,192,103);                                     -- To Valkurm Dunes at B-8
    elseif (zone == 201) then                                                -- From Cloister of Gales
        player:setPos(-291,-3,494,32,113);                                     -- To Cape Terrigan F-5
    -- Zulkheim {R}
    elseif (zone == 196) then                                                 -- From Gusgen Mines
        player:setPos(680,21,204,64,108);                                     -- To Konschtat Highlands at L-7
    elseif (zone == 193) then                                                 -- From Ordelle's Caves
        player:setPos(-261,23,123,192,102);                                 -- To La Theine Plateau at F-7
    -- Tavnazian Archipelago {R}
    elseif (zone == 27) then                                                 -- From Phomiuna Aqueducts
        player:setPos(540,-16,265,160,25)                                     -- To Misareaux Coast at K-7
    elseif (zone == 28) then                                                 -- From Sacrarium
        player:setPos(39,-24,743,64,25);                                     -- To Misareaux Coast at H-4
    elseif (zone == 29 or zone == 30 or zone == 31) then                        -- From Riverne - Site B01, Riverne - Site A01, Monarch Linn
        player:setPos(-483,-31,403,116,25);                                 -- To Misareaux Coast at D-6
    -- Mamool Ja Savagelands {R}
    elseif (zone == 65) then                                                 -- From Mamook
        player:setPos(-459.961,-4.357,-513.191,192,51);                     -- To Wajaom Woodlands at E-12
    elseif (zone == 66) then                                                    -- From Mamool Ja Training Grounds
        player:setPos(-172.863, -12.25, -801.021, 128, 52);                 -- Bhaflau Thickets
    elseif (zone == 67) then                                                 -- From Jade Sepulcher
        player:setPos(-125.762,-12.226,-499.689,124,52);                     -- To Bhaflau Thickets at I-9
    elseif (zone == 68) then                                                 -- From Aydeewa Subterrane
        player:setPos(95.251,-16.04,428.910,64,51);                         -- To Wajaom Woodlands at I-6
    -- Halvung Territory {R}
    elseif (zone == 62) then                                                 -- From Halvung
        player:setPos(860.994,-15.675,223.567,192,61);                         -- To Mount Zhayolm at L-7
    elseif (zone == 63) then                                                    -- From Lebros Cavern
        player:setPos(681.950, -24, 369.936, 64, 61);                        -- To Mount Zhayolm
    elseif (zone == 64) then                                                 -- From Navukgo Execution Chamber
        player:setPos(-630.146,-17.643,223.012,0,61);                         -- To Mount Zhayolm at C-7
    -- Arrapago Islands {R}
    elseif (zone == 54) then                                                 -- From Arrapago Reef
        player:setPos(227.36,-17.276,-60.718,95,79);                         -- To Caedarva Mire Azouph Isle at I-6
    elseif (zone == 55) then                                                 -- From Ilrusi Atoll
        player:setPos(9.304,-7.376,620.133,0,54);                             -- To Arrapago Reef G-4
    elseif (zone == 56) then                                                    -- From Periqia
        player:setPos(-252.715, -7.666, -30.64, 128, 79);                    -- To Caedarva Mire
    elseif (zone == 57 or zone == 78) then                                     -- From Talacca Cove, Hazhalm Testing Grounds
        player:setPos(-467.077,7.89,-538.603,0,79);                         -- To Caedarva Mire Azouph Isle at E-9
    elseif (zone == 69) then                                                    -- From Leujaoam Sanctum
        player:setPos(495.450, -28.25, -478.430, 32, 79);                    -- To Caedarva Mire
    -- Ruins of Alzadaal {R}
    elseif (zone == 72) then                                                 -- From Alzadaal Undersea Ruins
        player:setPos(14.186,-29.789,590.427,0,52);                         -- To Bhaflau Thickets at F-6
    elseif (zone == 75) then                                                    -- From Bhaflau Remnants I/II
        player:setPos(620,0,-260,64,72);                                     -- To Alzadaal Undersea Ruins BR H-8
    elseif (zone == 76) then                                                 -- From Silver Sea Remnants I/II
        player:setPos(580,0,500,192,72);                                     -- To Alzadaal Undersea Ruins SSR H-8
    elseif (zone == 77) then                                                    -- From Nyzul Isle Investigation/Uncharted Region
        player:setPos(180,0,20,0,72);                                         -- To Alzadaal Undersea Ruins
    -- Lumoria {R}
    elseif (zone == 34 or zone == 35 or zone == 36) then                        -- From Grand Palace of HuXzoi or The Garden of RuHmet or Empyreal Paradox
        player:setPos(-23,0,-465,64,33);                                    -- To Al'Taieu (H-11)
    -- The Aragoneu Front {R}
    elseif (zone == 99) then                                                 -- From Castle Oztroja (S)
        player:setPos(720.589,-31.999,-81.495,162,97);                         -- To Meriphataud Mountains (S) at L-8
    elseif (zone == 164) then                                                 -- From Garlaige Citadel (S)
        player:setPos(-112,-24,-403,192,98);                                 -- To Sauromugue Champaign (S) at H-11
    -- The Derfland Front {R}
    elseif (zone == 92) then                                                 -- From Beadeaux (S)
        player:setPos(548.199,24.999,-341.959,128,90);                         -- To Pashhow Marshlands (S) at K-11
    elseif (zone == 171) then                                                 -- From Crawlers' Nest (S)
        player:setPos(-356,-24,-763,192,91);                                 -- To Rolanberry Field (S) G-13
    -- The Valdeaunia Front {R}
    elseif (zone == 155 or zone == 138) then                                 -- Fromn Castle Zvahl Keep (S), Castle Zvahl Baileys (S)
        player:setPos(-414,-44,19,0,137);                                     -- To Xarcabard (S) at G-7
    -- The Norvallen Front {R}
    elseif (zone == 85) then                                                 -- From La Vaule (S)
        player:setPos(-203.576,-7.351,-494.53,0,82);                         -- To Jugner Forest (S) at G-12
    elseif (zone == 175) then                                                 -- From The Eldieme Necropolis (S)
        player:setPos(283.593,7.999,-403.207,145,84);                         -- To Batallia Downs (S) J-10
    end;

    -- TODO: Arrapago Remnants I/II, Zhaylohm Remnants I/II, Everbloom Hollow?, Ruhoyz Silvermines?, The Ashu Talif?
    -- TODO: Abyssea / SOA Areas
    -- MISC Flag in zone_settings will also need +1 or -1 depending on escape possibility.
end;

-----------------------------------
-- Teleport Items
-----------------------------------

function duchyEarring(player)
    player:setPos(5,0,-6,0,0xF4);
end;

function cobraStaff(player)
    player:setPos(-39,-5,231,68,0x5E);
end;

function ducalGaurdRing(player)
    player:setPos(48.930,10.002,-71.032,195,0xF3);
end;

function federationEarring(player)
    player:setPos(160,0,-10,0,238);
end;

function federationStablesScarf(player)
    player:setPos(123,-6,-134,0,241);
end;

function fourthStaff(player)
    player:setPos(-291, -10, -107, 212, 0x57);
end;

function homingRing(player) -- homing ring and return ring should return same positions.
    local zone = player:getZoneID();
    -- Ronfaure
    if (zone == 100 or zone == 101 or zone == 139 or zone == 140 or zone == 141 or zone == 142 or zone == 190 or zone == 167 or zone == 230 or zone == 231 or zone == 232 or zone == 233) then
        player:setPos(-437.688, -20.255, -219.227, 124, 100); -- {R}
    -- Zulkheim
    elseif (zone == 248 or zone == 102 or zone == 103 or zone == 108 or zone == 193 or zone == 196) then
        player:setPos(148.231, -7.975 , 93.479, 154, 103);       -- {R}
    -- Norvallen
    elseif (zone == 104 or zone == 105 or zone == 1 or zone == 2 or zone == 149 or zone == 150 or zone == 195) then
        player:setPos(62.030, 0.463, -2.025, 67, 104);           -- {R}
    -- Gustaberg
    elseif (zone == 234 or zone == 235 or zone == 236 or zone == 237 or zone == 106 or zone == 107 or zone == 172 or zone == 191 or zone == 143 or zone == 173 or zone == 144) then
        player:setPos(-580.161, 39.578, 62.68, 89, 106);      -- {R}
    -- Derfland
    elseif (zone == 110 or zone == 109 or zone == 197 or zone == 148 or zone == 147) then
        player:setPos(465.820, 23.625, 423.164, 29, 109);       -- {R}
    -- Sarutabatura
    elseif (zone == 238 or zone == 239 or zone == 240 or zone == 241 or zone == 242 or zone == 115 or zone == 116 or zone == 169 or zone == 170 or zone == 192 or zone == 194 or zone == 145 or zone == 146) then
        player:setPos(-17.921, -13.335, 318.156, 254, 115);      -- {R}
    -- Kolshushu
    elseif (zone == 249 or zone == 4 or zone == 117 or zone == 118 or zone == 198 or zone == 213) then
        player:setPos(-480.237, -30.943, 58.079, 62, 118);      -- {R}
    -- Aragoneu
    elseif (zone == 7 or zone == 119 or zone == 120 or zone == 200 or zone == 151 or zone == 152 or zone == 8) then
        player:setPos(-297.047, 16.988, 418.026, 225, 119);      -- {R}
    -- Fauregandi
    elseif (zone == 111 or zone == 166 or zone == 9 or zone == 204 or zone == 10 or zone == 206 or zone == 203) then
        player:setPos(-18.690, -60.048, -109.243, 100, 111);  -- {R}
    -- Valdeaunia
    elseif (zone == 112 or zone == 5 or zone == 161 or zone == 162 or zone == 165 or zone == 6) then
        player:setPos(211.210, -24.016, -207.338, 160, 112);  -- {R}
    -- Qufim Island
    elseif (zone == 127 or zone == 126 or zone == 157 or zone == 158 or zone == 184 or zone == 179) then
        player:setPos(-243.049, -19.983, 306.712, 71, 126);   -- {R}
    -- Li'Telor
    elseif (zone == 122 or zone == 121 or zone == 251 or zone == 153 or zone == 154 or zone ==202) then
        player:setPos(-37.669, 0.419, -141.216, 69, 121);      -- {R}
    -- Kuzotz
    elseif (zone == 247 or zone == 114 or zone == 125 or zone == 208 or zone == 209 or zone == 168) then
        player:setPos(-249.983, 7.965, -252.976, 122, 114);   -- {R}
    -- Vollbow
    elseif (zone == 113 or zone == 128 or zone == 174 or zone == 212 or zone == 201) then
        player:setPos(-176.360, 7.624, -63.580, 122, 113);      -- {R}
    -- Elshimo Lowlands
    elseif (zone == 250 or zone == 252 or zone == 176 or zone == 123) then
        player:setPos(-240.860, -0.031, -388.434, 64, 123);   -- {R}
    -- Elshimo Uplands
    elseif (zone == 124 or zone == 159 or zone == 160 or zone == 205 or zone == 163 or zone == 211 or zone == 207) then
        player:setPos(207.821, -0.128, -86.623, 159, 124);      -- {R}
    -- Tulia ?!
    elseif (zone == 130 or zone == 177 or zone == 178 or zone == 180 or zone == 181) then
        player:setPos(4, -54, -600, 192, 130);                -- Dummied out?
    -- Tavnazia
    elseif (zone == 26 or zone == 25 or zone ==24 or zone == 28 or zone == 29 or zone == 30 or zone == 31 or zone == 32 or zone == 27) then
        player:setPos(-535.861, -7.149, -53.628, 122, 24);    -- {R}
    end
end;

function kazhamEarring(player)
    player:setPos(-1,-4,-6,0,250);
end;

function kingdomEarring(player)
    player:setPos(154,-2,152,0,230);
end;

function kingdomStablesScarf(player)
    player:setPos(-7,2,-84,0,230);
end;

function laurelCrown(player)
    player:setPos(50,0,-18,0,243);
end;

function maatsCap(player)
    player:setPos(11,3,117,0,243);
end;

function mhauraEarring(player)
    player:setPos(0,-4,109,0,249);
end;

function nashmauEarring(player)
    player:setPos(11,2,-94,0,53);
end;

function nomadCap(player)
    local nation = player:getNation();
    if (nation == 0) then
        player:setPos(0154,-2,152,0,230);
    elseif (nation == 1) then
        player:setPos(84,0,-71,0,234);
    elseif (nation == 2) then
        player:setPos(-211,0,-119,0,239);
    end
end;

function norgEarring(player)
    player:setPos(-19,0,-53,0,252);
end;

function rabaoEarring(player)
    player:setPos(9,-2,-91,0,247);
end;

function ramStaff(player)
    player:setPos(-98, 1, -41, 224, 0x50);
end;

function republicEarring(player)
    player:setPos(-302,-12,-68,0,235);
end;

function republicStablesMedal(player)
    player:setPos(40,0,-90,0,234);
end;

function safeholdEarring(player)
    player:setPos(9,-9,11,0,26);
end;

function selbinaEarring(player)
    player:setPos(17,-14,95,0,248);
end;

function olduumRing(player) -- To Wajoam Laypoint
    player:setPos(-200.116, -10, 79.879, 213, 51); -- {R}
end;

function starsCap(player)
    player:setPos(50,0,-18,0,243);
end;

function tavnzanianRing(player)
    player:setPos(0,-23.5,34,64,26); -- {R}
end;

function toExitPromMea(player)
    player:setPos(179 ,35 ,256 ,63 ,117);
end;

function toExitPromHolla(player)
    player:setPos(337 ,19 ,-60 ,125 ,102);
end;

function toExitPromDem(player)
    player:setPos(136 ,19 ,220 ,130 ,108);
end;

function toLufaise(player)
    player:setPos(438 ,0 ,-18 ,11 ,24);
end;
