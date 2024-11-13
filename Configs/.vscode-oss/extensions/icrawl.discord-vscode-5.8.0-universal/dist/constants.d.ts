export declare const CLIENT_ID: "383226320970055681";
export declare const KNOWN_EXTENSIONS: {
    [key: string]: {
        image: string;
    };
};
export declare const KNOWN_LANGUAGES: {
    language: string;
    image: string;
}[];
export declare const EMPTY: "";
export declare const FAKE_EMPTY: "​​";
export declare const FILE_SIZES: readonly [" bytes", "KB", "MB", "GB", "TB"];
export declare const IDLE_IMAGE_KEY: "vscode-big";
export declare const DEBUG_IMAGE_KEY: "debug";
export declare const VSCODE_IMAGE_KEY: "vscode";
export declare const VSCODE_INSIDERS_IMAGE_KEY: "vscode-insiders";
export declare const UNKNOWN_GIT_BRANCH: "Unknown";
export declare const UNKNOWN_GIT_REPO_NAME: "Unknown";
export declare const enum REPLACE_KEYS {
    Empty = "{empty}",
    FileName = "{file_name}",
    DirName = "{dir_name}",
    FullDirName = "{full_dir_name}",
    Workspace = "{workspace}",
    VSCodeWorkspace = "(Workspace)",
    WorkspaceFolder = "{workspace_folder}",
    WorkspaceAndFolder = "{workspace_and_folder}",
    LanguageLowerCase = "{lang}",
    LanguageTitleCase = "{Lang}",
    LanguageUpperCase = "{LANG}",
    TotalLines = "{total_lines}",
    CurrentLine = "{current_line}",
    CurrentColumn = "{current_column}",
    FileSize = "{file_size}",
    AppName = "{app_name}",
    GitRepoName = "{git_repo_name}",
    GitBranch = "{git_branch}"
}
export declare const enum CONFIG_KEYS {
    Enabled = "enabled",
    DetailsIdling = "detailsIdling",
    DetailsEditing = "detailsEditing",
    DetailsDebugging = "detailsDebugging",
    LowerDetailsIdling = "lowerDetailsIdling",
    LowerDetailsEditing = "lowerDetailsEditing",
    LowerDetailsDebugging = "lowerDetailsDebugging",
    LowerDetailsNoWorkspaceFound = "lowerDetailsNoWorkspaceFound",
    LargeImageIdling = "largeImageIdling",
    LargeImage = "largeImage",
    SmallImage = "smallImage",
    SuppressNotifications = "suppressNotifications",
    WorkspaceExcludePatterns = "workspaceExcludePatterns",
    SwapBigAndSmallImage = "swapBigAndSmallImage",
    RemoveDetails = "removeDetails",
    RemoveLowerDetails = "removeLowerDetails",
    RemoveTimestamp = "removeTimestamp",
    RemoveRemoteRepository = "removeRemoteRepository",
    IdleTimeout = "idleTimeout"
}
