return {
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clangd = {
      excludeArgs = { "-frounding-match" };
    };
  }
}
