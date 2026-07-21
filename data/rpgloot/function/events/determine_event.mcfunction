function rpgloot:rng/1-100

execute if score rpgloot rpgloot.rng <= rpgloot eventchance run function rpgloot:events/eventhandler
