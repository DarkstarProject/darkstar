-----------------------------------
-- Area: Appolyon
-- NPC:  Radiant_Aureole
-- @pos 
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");
package.loaded["scripts/zones/Apollyon/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Apollyon/TextIDs");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
local count = trade:getItemCount();
if (player:hasKeyItem(COSMOCLEANSE)) then 
  if (count==1 and trade:hasItemQty(2127,1)) then-- metal chip
     player:setVar("Limbus_Trade_Item",32);
     player:tradeComplete();
     player:messageSpecial(CHIP_TRADE); 
         player:startEvent(0x7d00,0,0,0,32,0,0,0,0);
        player:setVar("limbusbitmap",32);
  elseif (count==4 and trade:hasItemQty(1988,1) and trade:hasItemQty(1987,1) and trade:hasItemQty(1910,1) and trade:hasItemQty(1909,1)) then
    player:setVar("Limbus_Trade_Item",16);
    player:tradeComplete();
    player:messageSpecial(CHIP_TRADE); 
    player:startEvent(0x7d00,0,0,0,16,0,0,0,0);
    player:setVar("limbusbitmap",16);
  end
 else
       player:messageSpecial(CONDITION_FOR_LIMBUS); 
     print("error player  don't have cosmo clean");
 end 
  
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
 local instancelist ={};
 local limbusbitmap = 0 ;
 local AllowLimbusToPlayer = true ;   
 local currentlimbus= TryTobackOnCurrentLimbus(player); 

  if ( npc:getID() == 16933242) then
         instancelist = APPOLLYON_SE_NE_BCNM_LIST;
  else
         instancelist = APPOLLYON_NW_SW_BCNM_LIST;
 end
printf("currentlimbus: %u",currentlimbus);       
    
  
   if (player:hasKeyItem(COSMOCLEANSE)) then  
       if (player:hasStatusEffect(EFFECT_BATTLEFIELD) == false) then  
         local LimbusTradeItem = player:getVar("Limbus_Trade_Item");
           for nt = 1,table.getn (instancelist),2 do
                 --   printf("list d'instance: %u",instancelist[nt]);       
               if (instancelist[nt+1][1]==true and player:hasKeyItem(WHITE_CARD)) then
                --   print("player_have_white_card");
                   limbusbitmap = limbusbitmap + instancelist[nt+1][4];
                --   printf("bitmapadd: %u",instancelist[nt+1][4]);
               end
               if (instancelist[nt+1][2]==true and player:hasKeyItem(RED_CARD)) then
                --   print("player_have_red_card");
                    limbusbitmap = limbusbitmap + instancelist[nt+1][4];
               --     printf("bitmapadd: %u",instancelist[nt+1][4]);
               end      
               if (instancelist[nt+1][3]==true and player:hasKeyItem(BLACK_CARD)) then
                --   print("player_have_black_card");
                    limbusbitmap = limbusbitmap + instancelist[nt+1][4];
                 --   printf("bitmapadd: %u",instancelist[nt+1][4]);
               end            
           end
        limbusbitmap= limbusbitmap + LimbusTradeItem;
      ----- /////////////////////////////////////////////on doit ajouter le mipmap pour l'item trade ici
       else
             local    status = player:getStatusEffect(EFFECT_BATTLEFIELD);
            local    playerbcnmid = status:getPower();
           -- check if the player has the key item for the current battlefield
           for nt = 1,table.getn (instancelist),2 do
               --     printf("list d'instance: %u",instancelist[nt]);       
                    if (instancelist[nt] == playerbcnmid) then
                        if (instancelist[nt+1][1]== true and player:hasKeyItem(WHITE_CARD) == false) then
                           AllowLimbusToPlayer = false;
                        end
                        if (instancelist[nt+1][2]== true  and player:hasKeyItem(RED_CARD) == false ) then
                           AllowLimbusToPlayer = false;
                        end                    
                        if (instancelist[nt+1][3]== true and player:hasKeyItem(BLACK_CARD) == false ) then
                           AllowLimbusToPlayer = false;
                        end                        
                        if (AllowLimbusToPlayer == true) then --player have the correct key item for the current battflield
                           limbusbitmap = instancelist[nt+1][4];
                        end
                        
                    end
           end
          
      
        
       end   
 


 
       if (limbusbitmap~= 0 ) then
           player:startEvent(0x7d00,0,0,0,limbusbitmap,0,0,0,0);
        player:setVar("limbusbitmap",limbusbitmap);
       else
       player:messageSpecial(CONDITION_FOR_LIMBUS); 
        print("player need a card for basic limbus");
        end    
        
  elseif (currentlimbus~=0) then    
           for nt = 1,table.getn (instancelist),2 do
               --     printf("list d'instance: %u",instancelist[nt]);       
                    if (instancelist[nt] == currentlimbus) then
                           limbusbitmap = instancelist[nt+1][4];
                    end
           end
        player:startEvent(0x7d00,0,0,0,limbusbitmap,0,0,0,0);
        player:setVar("limbusbitmap",limbusbitmap);
           
  else
       player:messageSpecial(CONDITION_FOR_LIMBUS); 
    print("error player  don't have cosmo clean");
  end 
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)


     if (csid == 0x7d00) then
       if (player:hasStatusEffect(EFFECT_BATTLEFIELD) == false) then 
           ResetPlayerLimbusVariable(player);
           player:setVar("characterLimbusKey",0);  
       else 
               local status = player:getStatusEffect(EFFECT_BATTLEFIELD);            
            player:setVar("LimbusID",status:getPower());
             player:setVar("characterLimbusKey",GetLimbusKeyFromInstance(status:getPower()));     
       end       
     player:updateEvent(2,player:getVar("limbusbitmap"),0,1,1,0);
     player:setVar("limbusbitmap",0);
     
     
     end
   
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
   if (csid == 0x7d00) then

   end
end;