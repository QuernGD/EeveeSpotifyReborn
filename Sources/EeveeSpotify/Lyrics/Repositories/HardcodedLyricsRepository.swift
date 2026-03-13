import Foundation

class HardcodedLyricsRepository: LyricsRepository {

    static let shared = HardcodedLyricsRepository()
    private init() {}

    // Add your songs here — match title and artist exactly as they appear in your MP3 tags
    private let hardcodedSongs: [(title: String, artist: String, lyrics: [(ms: Int, line: String)])] = [
        (
            title: "MONA LISA",
            artist: "Drake",
            lyrics: [
                (0,    "Look, you remind me of Jane Birkin, your body insane in person"),
                (5000, "Wanna do special things for you, you deserve it"),
                (7000, "But you're too famous to buy you purses"),
                (9000, "That barely scratches the surface"),
                (11000, "This time is different, you give me purpose"),
                (13000, "Tell me you taking it serious, I gotta ask how serious?"),
                (17000, "\'Cause your serious has just been not that serious"),
                (20000, "Got me on tour acting like I\'m not that curious"),
                (23000, "Ignoring all the pussy that\'s thrown at me"),
                (25000, "Been thinking \'bout home actually where"),
                (27000, "Roxx has Kim and Mark has Ashley and Niks has Ezee"),
                (30000, "And I, I don\'t even know what I have anymore"),
                (35000, "Evolving"),
                (38000, "Evolving"),
                (41000, "Evolving"),
                (44000, "Evolving"),
                (50000, "E..."),
                (59000, "Yeah,"),
                (62000, "Live from the Waldorf in Berlin"),
                (69000, "Coming at you once again"),
                (75000, "With stories of truth and stories of sin"),
                (80000, "(OvO sound radio)"),
                (86000, "Yeah, the ball is in your court"),
                (89000, "No defense, nobody\'s keeping score"),
                (92000, "No offense but I\'ve played this before"),
                (96000, "Maybe you can and you just don\'t care anymore"),
                (99000, "Evolving"),
                (102000, "Evolving"),
                (106000, "Evolving"),
                (109000, "E..."),
                (112000, "Yeah,"),
                (114000, "And I\'m right back here, when I said I wouldn\'t"),
                (117000, "Right"),
                (119000, "You were never a good girl"),
                (121000, "But, you\'re a better women now"),
                (123000, "Evolving"),
                (125000, "Evolving"),
                (128000, "Evolving"),
                (132000, "Evolving"),
            ]
        ),
        // Add more songs here following the same pattern
    ]

    func getLyrics(_ query: LyricsSearchQuery, options: LyricsOptions) throws -> LyricsDto {
        guard let match = hardcodedSongs.first(where: {
            $0.title.lowercased() == query.title.lowercased() &&
            $0.artist.lowercased() == query.primaryArtist.lowercased()
        }) else {
            throw LyricsError.noSuchSong
        }

        let lines = match.lyrics.map {
            LyricsLineDto(content: $0.line, offsetMs: $0.ms)
        }

        return LyricsDto(
            lines: lines,
            timeSynced: true,
            romanization: .original,
            translation: nil
        )
    }
}
