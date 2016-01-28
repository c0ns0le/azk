import { CliTrackerController } from 'azk/cli/cli_tracker_controller.js';
import Azk from 'azk';

export default class Version extends CliTrackerController {
  constructor(...args) {
    super(...args);
    this.require_terms = false;
  }

  index() {
    return Azk.gitCommitId.then((commitId) => {
      this.ui.output(`azk version ${Azk.version}, build ${commitId}`);
      return 0;
    });
  }
}
