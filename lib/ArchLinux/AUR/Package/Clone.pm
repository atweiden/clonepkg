use v6;
unit module ArchLinux::AUR::Package::Clone;

constant $base-url = 'https://aur.archlinux.org';

sub clonepkg(*@pkg --> Nil) is export
{
    await @pkg.hyper.map({ start run-clonepkg($_) });
}

sub run-clonepkg(Str:D $pkg --> Nil)
{
    my Str:D $url = get-url($pkg);
    run qqw<git clone $url>;
}

sub get-url(Str:D $pkg --> Str:D)
{
    my Str:D $url = $base-url ~ '/' ~ $pkg.trim ~ '.git';
}

# vim: set filetype=perl6 foldmethod=marker foldlevel=0:
