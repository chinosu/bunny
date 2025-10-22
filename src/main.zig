const std = @import("std");

pub fn main() !void {
    var buf: [1]u8 = undefined;
    try std.posix.getrandom(&buf);

    var out_buf: [1024]u8 = undefined;
    var out_writer = std.fs.File.stdout().writer(&out_buf);
    const out = &out_writer.interface;

    try out.writeAll(greets[buf[0] % greets.len]);
    try out.writeByte('\n');
    try out.flush();
}

const greets = [_][]const u8{
    \\
    \\  {\__/}
    \\  ( o.o)  💸
    \\  / > >
    \\
    ,
    \\
    \\  {\__/}
    \\  ( •ᴗ•)
    \\  / > 💎
    \\
    ,
    \\
    \\  <°))))><
    \\
    ,
    \\
    \\    ／l、
    \\  （ﾟ､ ｡ ７
    \\    l  ~ヽ
    \\    じしf_,)ノ
    \\
    ,
    \\
    \\  ≽^•༚• ྀི≼
    \\
    ,
    \\
    \\  ʕ ● ᴥ ●ʔ
    \\
    ,
    \\
    \\  ʕ•ᴥ•ʔ
    \\
    ,
    bunny("♥️ u want this?"),
    bunny("💖 mlem"),
    bunny("⭐️ miaow"),
    bunny("💗 kith"),
    bunny("💵 u want this money? spend it wisely"),
    bunny("> gimmie that"),
    bunny("🍿 24 dollars"),
    bunny("☕️ good morning"),
    bunny("📱 can i borrow ur charger"),
    bunny("🧻 skibidi"),
    cat("^.^"),
    cat("o.o"),
    cat("° o"),
};

fn bunny(comptime message: []const u8) []const u8 {
    return std.fmt.comptimePrint(
        \\
        \\  {s}
        \\  ( •.•)
        \\  / > {s}
        \\
    , .{ "{\\__/}", message });
}

fn cat(comptime eyes: []const u8) []const u8 {
    return std.fmt.comptimePrint(
        \\
        \\   /\_/\
        \\  ( {s} )
        \\   {s}> ^ <{s}
        \\
    , .{ eyes, "\x1b[0;31m", "\x1b[0m" });
}
