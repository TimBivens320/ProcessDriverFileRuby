module ArgumentHelper

    def self.has_invalid_arguments(args)
        args.length != 1
    end

    def self.should_display_help(args)
        args[0] == "-?"
    end

    def self.get_filename(args)
        args[0]
    end
end
