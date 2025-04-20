return {
	"lucidph3nx/nvim-sops",
	event = { "BufEnter" },
	opts = {
    enabled = true,
    debug = false,
    binPath = 'sops', -- assumes its on $PATH
    defaults = { -- overriding any env vars as needed
        awsProfile = 'AWS_PROFILE',
        ageKeyFile = '~/.config/ageKeys/backend-blockchain-services.txt',
        gcpCredentialsPath = 'GOOGLE_APPLICATION_CREDENTIALS',
    }
	},
  keys = {
    { '<leader>ef', vim.cmd.SopsEncrypt, desc = '[E]ncrypt [F]ile' },
    { '<leader>df', vim.cmd.SopsDecrypt, desc = '[D]ecrypt [F]ile' },
  },
}
