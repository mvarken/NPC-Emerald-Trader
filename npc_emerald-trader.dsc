# -------------------------------------------
# NPC Emerald Trader
# Created by: mvarken
# GitHub: https://github.com/mvarken
#
# Requirements:
# Citizen Built
# Denizen Built
# -------------------------------------------
EmeraldNPC:
  type: assignment
  actions:
    on assignment:
    - trigger name:click state:true
    on click:
    - if <player.item_in_hand>:
#Here you set the item that the NPC should accept, in this case, "Emerald"
        - if <player.inventory.contains_item[emerald].quantity[1]>:
            - animate <npc> animation:arm_swing
            - take item:emerald quantity:1
            - playsound <player> sound:ENTITY_EXPERIENCE_ORB_PICKUP pitch:1
            - equip hand:emerald
            - wait 1s
            - playsound <player> sound:ENTITY_EXPERIENCE_ORB_PICKUP pitch:1
            - equip offhand:enchanted_book
            - wait 4s
            - equip hand:air
            - equip offhand:air
            - playsound <player> sound:ENTITY_PLAYER_LEVELUP pitch:1
            - animate <npc> animation:arm_swing
            - random:
#Here you can insert your own items that the NPC will drop randomly.
                - drop sand 1 at:<player.location>
                - drop dirt 1 at:<player.location>
                - drop diamond 1 at:<player.location>
                - drop emerald 1 at:<player.location>
                - drop iron_ingot 1 at:<player.location>
                - drop gold_ingot 1 at:<player.location>
            - determine passively cancelled
            - stop
        - if !<player.inventory.contains_item[emerald].quantity[1]>:
            - narrate "<&4><npc.name><&r>: <&3>Hallo, die Items in deinem Inventar tausche ich nicht ein."
            - wait 0.5s
            - narrate "<&3>Versuche es mal mit einem Emerald."
    - if !<player.item_in_hand>:
        - actionbar "Klick mich mit einem Item an!"
        - stop
