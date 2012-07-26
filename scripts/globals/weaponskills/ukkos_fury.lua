-----------------------------------     
-- Ukko's Fury
-- Great Axe Weapon Skill
-- Skill Level: N/A
-- Description: Delivers a twofold attack that slows target. Chance of critical hit varies with TP. Ukonvasara: Aftermath.
-- Available only when equipped with Ukonvasara (85), Ukonvasara (90), Ukonvasara (95), Maschu +1, Maschu +2.
-- Aligned with the Light Gorget, Breeze Gorget & Thunder Gorget.
-- Aligned with the Light Belt, Breeze Belt & Thunder Belt.
-- Element: None
-- Skillchain Properties: Light/Fragmentation
-- Modifiers: STR:60%
-- Damage Multipliers by TP:
-- 100%TP	200%TP	300%TP
-- 2.0		2.0		2.0
-- Critical Chance added with TP:
-- 100%TP	200%TP	300%TP
-- 20%		35%		55%
--
-----------------------------------        
require("scripts/globals/status");      
require("scripts/globals/settings");    
require("scripts/globals/weaponskills");        
-----------------------------------     
        
function OnUseWeaponSkill(player, target, wsID) 
        
        numHits = 2;
        ftp100 = 2; ftp200 = 2; ftp300 = 2;
        str_wsc = 0.6; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
        crit100 = 0.20; crit200 = 0.35; crit300 = 0.55;
        canCrit = true;
        acc100 = 0.0; acc200= 0.0; acc300= 0.0;
        atkmulti = 1;
        damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);        
        return tpHits, extraHits, damage;
end     