-----------------------------------     
-- Rudra's Storm
-- Dagger weapon skill  
-- Skill level: N/A
-- Deals triple damage and weighs target down (duration: 60s). Damage varies with TP.
-- Aligned with the Aqua Gorget, Snow Gorget & Shadow Gorget.
-- Aligned with the Aqua Belt, Snow Belt & Shadow Belt.       
-- Element: None        
-- Modifiers: DEX:60% 
-- 100%TP    200%TP    300%TP   
-- 3.25      4.25      5.25     
-----------------------------------     
require("scripts/globals/status");      
require("scripts/globals/settings");    
require("scripts/globals/weaponskills");        
-----------------------------------     
        
function OnUseWeaponSkill(player, target, wsID) 
        
        numHits = 1;
        ftp100 = 3.25; ftp200 = 4.25; ftp300 = 5.25;
        str_wsc = 0.0; dex_wsc = 0.6; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
        crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
        canCrit = false;
        acc100 = 0.0; acc200= 0.0; acc300= 0.0;
        atkmulti = 1;
        damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
        return tpHits, extraHits, damage;
        
end     