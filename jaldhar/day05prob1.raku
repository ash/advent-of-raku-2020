#!/usr/bin/raku

sub MAIN() {
    my $highest = 0;

    for "input/day05.input".IO.lines -> $line {
        my @bsp = $line.comb;
        my $minrow = 0;
        my $maxrow = 127;
        for @bsp[0 .. 6] -> $row {
            given $row {
                when 'F' {
                    $maxrow = $minrow + floor(($maxrow - $minrow) / 2);
                }
                when 'B' {
                    $minrow = $maxrow - floor(($maxrow - $minrow) / 2);
                }
                default {
                }
            }
        }

        my $mincol = 0;
        my $maxcol = 7;
        for @bsp[7 .. 9] -> $col {
            given $col {
                when 'L' {
                    $maxcol = $mincol + floor(($maxcol - $mincol) / 2);
                }
                when 'R' {
                    $mincol = $maxcol - floor(($maxcol - $mincol) / 2);
                }
                default {
                }
            }

        }

        my $seatid = $maxrow * 8 + $maxcol;

        if $seatid > $highest {
            $highest = $seatid;
        }
    }

    say $highest;
}
