# Bloodrage

A World of Warcraft Vanilla (v1.1.12) Addon to simplify Warrior tanking.

## Usage

Provide a single button to put you in the "default" stance and activate
Bloodrage. The "default" stance is determined by the skilltree - if Shild Slam
is learned, it's Defensive Stance (signified by a Prot build), otherwise it's
Berserker Stance (signified by a Fury build).

## Installation

Clone the repository into your `Addons` folder:

    cd <WOW_BASE_DIR>/Interface/Addons
    git clone https://github.com/muellerj/Bloodrage

Create a macro to call `Bloodrage()` or `/bloodrage`:

    /bloodrage

    # or

    /script Bloodrage();

## Commands

`Threat` can be enabled or disabled and its operation inspected:

    /bloodrage             Cast "best" threat ability
    /bloodrage debug       Toggle debug messages on/off

## Bugtracker

Please create an issue at https://github.com/muellerj/Bloodrage/issues

## Credit

Many of the boilerplate functions are taken directly from `Fury.lua` by Bhaerau
(http://www.vanilla-addons.com/dls/fury/).

## Contributing

1. Fork it (https://github.com/muellerj/Bloodrage/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
