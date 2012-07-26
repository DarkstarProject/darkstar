-----------------------------------     
-- Blade HI    
-- Katana weapon skill  
-- Skill level: N/A
-- Description: Deals quadruple damage. Chance of critical hit varies with TP. Kannagi: Aftermath.
-- Available only when equipped with Kannagi (85)/(90)/(95)/(99) or Tobi +1/+2/+3.
-- Aligned with the Shadow Gorget & Soil Gorget.
-- Aligned with the Shadow Belt & Soil Belt.
-- Element: None        
-- Modifiers: AGI:60% 
-- Skillchain Properties: Darkness/Gravitation
-- 100%TP    200%TP    300%TP   
-- 4.00      4.00      4.00   
--
-- Critical Hit Rate by TP:
-- 100%TP    200%TP    300%TP
-- 15%	     20%       25%
--
-----------------------------------        
require("scripts/globals/status");      
require("scripts/globals/settings");    
require("scripts/globals/weaponskills");        
-----------------------------------     
        
function OnUseWeaponSkill(player, target, wsID) 
        
        numHits = 1;
        ftp100 = 4; ftp200 = 4; ftp300 = 4;
        str_wsc = 0.0; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.6; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
        crit100 = 0.15; crit200 = 0.2; crit300 = 0.25;
        canCrit = true;
        acc100 = 0.0; acc200= 0.0; acc300= 0.0;
        atkmulti = 1;
        damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);        

        return tpHits, extraHits, damage;
        
end     