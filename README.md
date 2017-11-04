# About livecoding

Livecoding is a simple library that enables coding on a live/running system.

# Usage

To start a swank server *and* run a loop call livecoding:start with a function.
The function will be called in a loop until livecoding:stop is called. To restart
the loop call livecoding:start again.
