set signals [list]
lappend signals "$CLK"
lappend signals "$DIR"
lappend signals "$MODO"
lappend signals "$ENB"
lappend signals "$S_IN"
lappend signals "$D"
lappend signals "$Qcond"
lappend signals "$Qstruct"
lappend signals "$S_OUTcond"
lappend signals "$S_OUTstruct"

set num_added [ gtkwave::addSignalsFromList $signals ]
