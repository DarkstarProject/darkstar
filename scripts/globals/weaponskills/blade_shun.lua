-----------------------------------     
-- Blade Shun
-- Katana weapon skill  
-- Skill level: N/A
-- Description: Delivers a fivefold attack. Attack power varies with TP.
-- In order to obtain Blade: Shun the quest Martial Mastery must be completed.
-- This Weapon Skill's first hit fTP is duplicated for all additional hits.
-- Alignet with the Flame Gorget, Light Gorget & Thunder Gorget.
-- Alignet with the Flame Belt, Light Belt & Thunder Belt.
-- Element: None
-- Skillchain Properties: Fusion/Impaction
-- Modifiers: DEX:20~100%, depending on merit points ugrades.
-- Damage Multipliers by TP:
-- 100%	    200%	  300%
-- 0.6875	0.6875	  0.6875
-----------------------------------        
require("scripts/globals/status");      
require("scripts/globals/settings");    
require("scripts/globals/weaponskills");        
-----------------------------------     
        
function OnUseWeaponSkill(player, target, wsID) 
        
        numHits = 5;
        ftp100 = 0.6875; ftp200 = 0.6875; ftp300 = 0.6875;
        str_wsc = 0.0; dex_wsc = 0.2; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
        crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
        canCrit = false;
        acc100 = 0.0; acc200= 0.0; acc300= 0.0;
        atkmulti = 1;
        damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);        
        return tpHits, extraHits, damage;
        
end     