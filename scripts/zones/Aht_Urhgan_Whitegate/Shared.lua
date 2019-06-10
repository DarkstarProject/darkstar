-----------------------------------
-- Tables and Functions Used at Multiple Places within Aht Urgan Whitegate
-----------------------------------
require("scripts/globals/item")
require("scripts/globals/settings")

-- Lua Set Initializer http://www.lua.org/pil/11.5.html
function Set (list)
    local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
end

-- Set of Royal Palace Approved Armor
ROYAL_PALACE_ALLOWED_BODY_ARMORS = Set{
    dsp.item.adaman_cuirass, -- Adaman Cuirass Lv. 73 WAR / PLD
    dsp.item.gem_cuirass, -- Gem Cuirass Lv. 73 WAR / PLD
    dsp.item.aketon, -- Aketon Lv. 60 MNK / WHM / RDM / THF / PLD / BST / BRD / DRG / SMN / BLU / COR / PUP / DNC
    dsp.item.aketon_HQ1, -- Aketon +1 Lv. 60 MNK / WHM / RDM / THF / PLD / BST / BRD / DRG / SMN / BLU / COR / PUP / DNC
    dsp.item.amir_korazin, -- Amir Korazin Lv. 72 WAR / PLD / DRK / SAM /DRG
    dsp.item.arhats_gi, -- Arhat's Gi Lv. 64 MNK / SAM / NIN
    dsp.item.arhats_gi_HQ1, -- Arhat's Gi +1 Lv. 64 MNK / SAM / NIN
    dsp.item.barone_corazza, -- Barone Corazza Lv. 70 WAR / DRG
    dsp.item.conte_corazza, -- Conte Corazza Lv. 70 WAR / DRG
    dsp.item.black_cloak, -- Black Cloak Lv. 68 BLM
    dsp.item.demons_cloak, -- Demon's Cloak Lv. 68 BLM
    dsp.item.black_cotehardie, -- Black Cotehardie Lv. 59 MNK / WHM / BLM / RDM / THF / BST / BRD / RNG / NIN / SMN / BLU / PUP / DNC / SCH
    dsp.item.flora_cotehardie, -- Flora Cotehardie Lv. 59 MNK / WHM / BLM / RDM / THF / BST / BRD / RNG / NIN / SMN / BLU / PUP / DNC / SCH
    dsp.item.blessed_briault, -- Blessed Briault Lv. 70 WHM
    dsp.item.blessed_briault_HQ1, -- Blessed Briault +1 Lv. 70 WHM
    dsp.item.blue_cotehardie, -- Blue Cotehardie Lv. 69 RDM / THF / RNG / NIN / COR / DNC
    dsp.item.blue_cotehardie_HQ1, -- Blue Cotehardie +1 Lv. 69 RDM / THF / RNG / NIN / COR / DNC
    dsp.item.byrnie, -- Byrnie Lv. 60 WAR / PLD / DRK / BST / SAM / NIN
    dsp.item.byrnie_NQ1, -- Byrnie +1 Lv. 60 WAR / PLD / DRK / BST / SAM / NIN
    dsp.item.brigandine, -- Brigandine Lv. 45 WAR / RDM / THF / PLD / DRK / BST / BRD / RNG / SAM / NIN / DRG / BLU / COR / DNC
    dsp.item.brigandine_HQ1, -- Brigandine +1 Lv. 45 WAR / RDM / THF / PLD / DRK / BST / BRD / RNG / SAM / NIN / DRG / BLU / COR / DNC
    dsp.item.cardinal_vest, -- Cardinal Vest Lv. 73 WAR / RDM / THF / PLD / DRK / BST / BRD / RNG / SAM / NIN / DRG / BLU / COR / DNC
    dsp.item.bachelor_vest, -- Bachelor Vest Lv. 73 WAR / RDM / THF / PLD / DRK / BST / BRD / RNG / SAM / NIN / DRG / BLU / COR / DNC
    dsp.item.chasuble, -- Chasuble Lv. 72 RDM
    dsp.item.chasuble_HQ1, -- Chasuble +1 Lv. 72 RDM
    dsp.item.dusk_jerkin, -- Dusk Jerkin Lv. 72 WAR / RDM / THF / PLD / DRK / BST /BRD / RNG / SAM / NIN / DRG / BLU / COR / DNC
    dsp.item.dusk_jerkin_HQ1, -- Dusk Jerkin +1 Lv. 72 WAR / RDM / THF / PLD / DRK / BST /BRD / RNG / SAM / NIN / DRG / BLU / COR / DNC
    dsp.item.dragon_harness, -- Dragon Harness Lv. 73 THF
    dsp.item.dragon_harness_HQ1, -- Dragon Harness +1 Lv. 73 THF
    dsp.item.errant_hpl, -- Errant Houppelande Lv. 72 WHM / BLM / RDM / BRD / SMN / BLU / PUP / SCH
    dsp.item.mahatma_hpl, -- Mahatma Houppelande Lv. 72 WHM / BLM / RDM / BRD / SMN / BLU / PUP / SCH
    dsp.item.hachiman_domaru, -- Hachiman Domaru Lv. 70 SAM
    dsp.item.hmn_domaru_HQ1, -- Hachiman Domaru +1 Lv. 70 SAM
    dsp.item.haubergeon, -- Haubergeon Lv. 59 WAR / PLD / DRK / BST / SAM /NIN
    dsp.item.haubergeon_HQ1, -- Haubergeon Lv. 59 WAR / PLD / DRK / BST / SAM /NIN
    dsp.item.hauberk, -- Hauberk Lv. 69 WAR / DRK / BST
    dsp.item.hauberk_HQ1, -- Hauberk +1 Lv. 69 WAR / DRK / BST
    dsp.item.holy_breastplate, -- Holy Breastplate Lv. 40 WHM
    dsp.item.divine_breastplate, -- Divine Breastplate Lv. 40 WHM
    dsp.item.homam_corazza, -- Homam Corazza Lv. 75 THF / PLD / DRK / DRG / BLU
    dsp.item.igqira_weskit, -- Igqira Weskit Lv. 73 BLM
    dsp.item.genie_weskit, -- Genie Weskit Lv. 73 BLM
    dsp.item.jaridah_peti, -- Jaridah Peti Lv. 55 WAR / RDM / THF / PLD / DRK / BST / BRD / RNG / SAM / NIN / DRG / BLU / COR / DNC
    dsp.item.akinji_peti, -- Akinji Peti Lv. 55 WAR / RDM / THF / PLD / DRK / BST / BRD / RNG / SAM / NIN / DRG / BLU / COR / DNC
    dsp.item.justaucorps, -- Justaucorps Lv. 58 MNK / WHM / BLM / RDM / THF / DRK / BRD / RNG / SMN / BLU / COR / PUP / DNC / SCH
    dsp.item.justaucorps_HQ1, -- Justaucorps +1 Lv. 58 MNK / WHM / BLM / RDM / THF / DRK / BRD / RNG / SMN / BLU / COR / PUP / DNC / SCH
    dsp.item.nashira_manteel, -- Nashira Manteel Lv. 75 WHM / BLM / RDM / SMN / BLU
    dsp.item.nobles_tunic, -- Noble's Tunic Lv. 68 WHM
    dsp.item.aristocrats_coat, -- Aristocrat's Coat Lv. 68 WHM
    dsp.item.pln_khazagand, -- Pahluwan Khazagand Lv. 72 MNK / RDM / THF / BST / RNG / NIN / DRG / COR / PUP / DNC
    dsp.item.plastron, -- Plastron Lv. 71 DRK
    dsp.item.plastron_HQ1, -- Plastron +1 Lv. 71 DRK
    dsp.item.rasetsu_samue, -- Rasetsu Samue Lv. 72 MNK / SAM / NIN
    dsp.item.rasetsu_samue_HQ1, -- Rasetsu Samue +1 Lv. 72 MNK / SAM / NIN
    dsp.item.vermillion_cloak, -- Vermillion Cloak Lv. 59 MNK / WHM / BLM / RDM / PLD / BRD / RNG / SMN / BLU / PUP / SCH
    dsp.item.royal_cloak, -- Royal Cloak Lv. 59 MNK / WHM / BLM / RDM / PLD / BRD / RNG / SMN / BLU / PUP / SCH
    dsp.item.scorpion_harness, -- Scorpion Harness Lv. 57 WAR / MNK / RDM / THF / PLD / DRK / BST / BRD / SAM / NIN / DRG / BLU / COR / DNC
    dsp.item.scp_harness_HQ1, -- Scorpion Harness +1 Lv. 57 WAR / MNK / RDM / THF / PLD / DRK / BST / BRD / SAM / NIN / DRG / BLU / COR / DNC
    dsp.item.sipahi_jawshan, -- Sipahi Jawshan Lv. 59 WAR / PLD / DRK / BST / SAM
    dsp.item.abtal_jawshan, -- Abtal Jawshan Lv. 59 WAR / PLD / DRK / BST / SAM
    dsp.item.shair_manteel, -- Sha'ir Manteel Lv. 72 BRD
    dsp.item.sheikh_manteel -- Sheikh Manteel Lv. 72 BRD
}

-- Function to check if the player is wearing armor that is appropriate for the royal palace.
function doRoyalPalaceArmorCheck(player)
    local bodyArmor = player:getEquipID(dsp.slot.BODY);
    local check = (ROYAL_PALACE_ALLOWED_BODY_ARMORS[bodyArmor] ~= nil);

    local hasHandArmor = player:getEquipID(dsp.slot.HANDS);
    local hasLegArmor = player:getEquipID(dsp.slot.LEGS);
    local hasFeetArmor = player:getEquipID(dsp.slot.FEET);

    if (hasHandArmor == 0 or hasLegArmor == 0 or hasFeetArmor == 0) then
        check = false;
        -- printf("Royal Palace Armor Check for Player <%s> -> Missing Required Hand/Leg/Feet Armor", player:getName());
    end

    -- printf("Royal Palace Armor Check for Player <%s> with Body Armor <%u>, allowed = %s", player:getName(), bodyArmor, check);

    return check;
end
