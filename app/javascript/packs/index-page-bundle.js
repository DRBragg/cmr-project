import ReactOnRails from 'react-on-rails';

import IndexPage from '../bundles/IndexPage/components/IndexPage';
import RepPage from '../bundles/ShowPage/components/RepPage';
import Navigation from '../bundles/NavBar/components/navBar';

ReactOnRails.register({
  IndexPage, RepPage, Navigation
});
