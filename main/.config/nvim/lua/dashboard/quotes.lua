local M = {}

function M.get(favs)
    if favs then return {
        { 'People say nothing is impossible, but I do nothing every day.', '', '- A.A. Milne, Winnie-the-Pooh' },
        {
            'One of the advantages of being disorganized is that one is always having surprising discoveries.',
            '',
            '- A.A. Milne'
        },
        { 'The things that make me different are the things that make me.', '', '- A.A. Milne' },
        { 'Did you ever stop to think, and forget to start again?', '', '- A.A. Milne' },
        { 'Think, think, think.', '', '- A.A. Milne, Winnie-the-Pooh' },
        { 'Sometimes I sits and thinks, and sometimes I just sits...', '', '- A.A. Milne' }
    } else return {
        -- trimmed down from original list by @mhinz
        { "If you don't fail at least 90% of the time, you're not aiming high enough.", "", "- Alan Kay" },
        { "I would rather die of passion than of boredom.", "", "- Vincent Van Gogh" },
        { "If a system is to serve the creative spirit, it must be entirely comprehensible to a single individual." },
        {
            "The essence of XML is this: the problem it solves is not hard, and it does not solve the problem well.",
            "",
            "- Phil Wadler",
        },
        {
            "A good programmer is someone who always looks both ways before crossing a one-way street.",
            "",
            "- Doug Linder",
        },
        {
            "Unix was not designed to stop its users from doing stupid things, as that would also stop them from doing clever things.",
        },
        {
            "Contrary to popular belief, Unix is user friendly. It just happens to be very selective about who it decides to make friends with.",
        },
        { "Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away." },
        { "Fancy algorithms are slow when n is small, and n is usually small.", "", "- Rob Pike" },
        { "Methods are just functions with a special first argument.", "", "- Andrew Gerrand" },
        { "Sign your work.", "", "Craftsmen of an earlier age were proud to sign their work. You should be, too." },
        { "Weeks of programming can save you hours of planning." },
        { "To iterate is human, to recurse divine.", "", "- L. Peter Deutsch" },
        { "Computers are useless. They can only give you answers.", "", "- Pablo Picasso" },
        {
            "It's ridiculous to live 100 years and only be able to remember 30 million bytes. You know, less than a compact disc. The human condition is really becoming more obsolete every minute.",
            "",
            "- Marvin Minsky",
        },
        {
            "Most software today is very much like an Egyptian pyramid with millions of bricks piled on top of each other, with no structural integrity, but just done by brute force and thousands of slaves.",
            "",
            "- Alan Kay",
        },
        {
            "There are two major products that come out of Berkeley: LSD and UNIX. We don't believe this to be a coincidence.",
            "",
            "- Jeremy S. Anderson",
        },
        { "The function of good software is to make the complex appear to be simple.", "", "- Grady Booch" },
        {
            "There's an old story about the person who wished his computer were as easy to use as his telephone. That wish has come true, since I no longer know how to use my telephone.",
            "",
            "- Bjarne Stroustrup",
        },
        { 'There are only two industries that refer to their customers as "users".', "", "- Edward Tufte" },
        {
            "Most of you are familiar with the virtues of a programmer. There are three, of course: laziness, impatience, and hubris.",
            "",
            "- Larry Wall",
        },
        {
            "Computer science education cannot make anybody an expert programmer any more than studying brushes and pigment can make somebody an expert painter.",
            "",
            "- Eric S. Raymond",
        },
        {
            "Measuring programming progress by lines of code is like measuring aircraft building progress by weight.",
            "",
            "- Bill Gates",
        },
        {
            "Don't worry if it doesn't work right. If everything did, you'd be out of a job.",
            "",
            "- Mosher's Law of Software Engineering",
        },
        { "Nothing is more permanent than a temporary solution." },
        { "They did not know it was impossible, so they did it!", "", "- Mark Twain" },
        {
            "The object-oriented model makes it easy to build up programs by accretion. What this often means, in practice, is that it provides a structured way to write spaghetti code.",
            "",
            "- Paul Graham",
        },
        { "Question: How does a large software project get to be one year late?", "Answer: One day at a time!" },
        {
            "The first 90% of the code accounts for the first 90% of the development time. The remaining 10% of the code accounts for the other 90% of the development time.",
            "",
            "- Tom Cargill",
        },
        {
            "In software, we rarely have meaningful requirements. Even if we do, the only measure of success that matters is whether our solution solves the customer's shifting idea of what their problem is.",
            "",
            "- Jeff Atwood",
        },
        {
            "If debugging is the process of removing bugs, then programming must be the process of putting them in.",
            "",
            "- Edsger W. Dijkstra",
        },
        { "640K ought to be enough for anybody.", "", "- Bill Gates, 1981" },
        { "To understand recursion, one must first understand recursion.", "", "- Stephen Hawking" },
        {
            "Every great developer you know got there by solving problems they were unqualified to solve until they actually did it.",
            "",
            "- Patrick McKenzie",
        },
        {
            "Walking on water and developing software from a specification are easy if both are frozen.",
            "",
            "- Edward V. Berard",
        },
        {
            "Be curious. Read widely. Try new things. I think a lot of what people call intelligence boils down to curiosity.",
            "",
            "- Aaron Swartz",
        },
        { "What one programmer can do in one month, two programmers can do in two months.", "", "- Frederick P. Brooks" },
    } end
end

return M
