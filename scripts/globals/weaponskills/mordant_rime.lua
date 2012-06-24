-----------------------------------     
-- Mordant Rime
-- Dagger weapon skill  
-- Skill level: N/A
-- Description: Delivers a twofold attack that decreases target's movement speed. Chance of decreasing movement speed varies with TP. Carnwenhan: Aftermath effect varies with TP.
-- Aligned with the Breeze Gorget, Thunder Gorget, Aqua Gorget & Snow Gorget.
-- Aligned with the Breeze Belt, Thunder Belt, Aqua Belt & Snow Belt. 
-- Element: None
-- Skillchain Properties: Fragmentation/Distortion
-- Modifiers: DEX:30% ; CHR:50%
--
-- Damage Multipliers by TP:
-- 100%TP	200%TP	300%TP
-- 3.0	    3.0	    3.0
--
-- Skillchain Properties: Fragmentation/Distortion
-----------------------------------             
require("scripts/globals/status");      
require("scripts/globals/settings");    
require("scripts/globals/weaponskills");        
-----------------------------------     
        
function OnUseWeaponSkill(player, target, wsID) 
        
        numHits = 2;
        ftp100 = 3; ftp200 = 3; ftp300 = 3;
        str_wsc = 0.0; dex_wsc = 0.3; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.5;
        crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
        canCrit = false;
        acc100 = 0.0; acc200= 0.0; acc300= 0.0;
        atkmulti = 1;
        damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
        return damage;
        
end     