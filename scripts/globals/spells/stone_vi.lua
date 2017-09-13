++-----------------------------------------
+-- Spell: Stone VI
+-- Deals stone damage to an enemy.
+-----------------------------------------
+
+require("scripts/globals/magic");
+require("scripts/globals/status");
+
+-----------------------------------------
+-- OnSpellCast
+-----------------------------------------
+
+function onMagicCastingCheck(caster, target, spell)
+    return 0;
+end;
+
+function onSpellCast(caster, target, spell)
+    local spellParams = {};
+    spellParams.hasMultipleTargetReduction = false;
+    spellParams.resistBonus = 1.0;
     spellParams.V0 = 746;
+    spellParams.V50 = 1096;
+    spellParams.V100 = 1379;
+    spellParams.V200 = 1896;
+    spellParams.M0 = 7;
+    spellParams.M50 = 6;
+    spellParams.M100 = 5;
+    spellParams.M200 = 4;

+    return doElementalNuke(caster, spell, target, spellParams);
+end;
