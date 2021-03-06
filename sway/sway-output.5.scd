sway-output(5)

# NAME

sway-output - output configuration commands for sway

# DESCRIPTION

You may combine output commands into one, like so:

	output HDMI-A-1 mode 1920x1080 pos 1920,0 bg ~/wallpaper.png stretch

You can get a list of output names with *swaymsg -t get\_outputs*. You may also
match any output by using the output name "\*".

Some outputs may have different names when disconnecting and reconnecting. To
identify these, the name can be substituted for a string consisting of the make,
model and serial which you can get from *swaymsg -t get\_outputs*. Each value
must be separated by one space. For example:

	output "Some Company ABC123 0x00000000" pos 1920,0

# COMMANDS

*output* <name> mode|resolution|res <WIDTHxHEIGHT>[@<RATE>[Hz]]
	Configures the specified output to use the given mode. Modes are a
	combination of width and height (in pixels) and a refresh rate that your
	display can be configured to use. For a list of available modes for each
	output, use *swaymsg -t get\_outputs*.

	Examples:

		output HDMI-A-1 mode 1920x1080

		output HDMI-A-1 mode 1920x1080@60Hz

*output* <name> position|pos <X> <Y>
	Places the specified output at the specific position in the global
	coordinate space.

*output* <name> scale <factor>
	Scales the specified output by the specified scale _factor_. An integer is
	recommended, but fractional values are also supported. If a fractional
	value are specified, be warned that it is not possible to faithfully
	represent the contents of your windows - they will be rendered at the next
	highest integral scale factor and downscaled. You may be better served by
	setting an integral scale factor and adjusting the font size of your
	applications to taste.

*output* <name> background|bg <file> <mode> [<fallback\_color>]
	Sets the wallpaper for the given output to the specified file, using the
	given scaling mode (one of "stretch", "fill", "fit", "center", "tile"). If
	the specified file cannot be accessed or if the image does fill the entire
	output, a fallback color may be provided to cover the rest of the output.
	__fallback\_color__ should be specified as _#RRGGBB_. Alpha is not
	supported.

*output* <name> background|bg <color> solid\_color
	Sets the background of the given output to the specified color. _color_
	should be specified as _#RRGGBB_. Alpha is not supported.

*output* <name> transform <transform>
	Sets the background transform to the given value. Can be one of "90", "180",
	"270" for rotation; or "flipped", "flipped-90", "flipped-180", "flipped-270"
	to apply a rotation and flip, or "normal" to apply no transform.

*output* <name> disable|enable
	Enables or disables the specified output (all outputs are enabled by
	default).

# SEE ALSO

*sway*(5) *sway-input*(5)
