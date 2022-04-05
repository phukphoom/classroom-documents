import { MemberCard } from './components';

const members = [
    {
        name: 'Nattapon Sukthaworn',
        id: '62010278',
        info: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam condimentum sapien eget nisi vestibulum lacinia. Maecenas eget lectus in nibh placerat sagittis. Pellentesque dignissim ut sapien nec consequat. Aenean id mattis eros. Phasellus vulputate ante at congue tincidunt. Quisque nibh nisi, lobortis eget magna non, fermentum molestie leo. Vestibulum eu risus elit. Vestibulum volutpat facilisis dignissim. In quis mauris vitae augue molestie volutpat. Ut felis mauris, imperdiet at elementum vitae, dapibus vel nunc. Etiam a neque laoreet, blandit nisl et, maximus nisl. Mauris rhoncus eleifend mi ac congue. Mauris feugiat convallis ante, ac euismod erat suscipit eu.',
        imgSrc: 'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg',
    },
    {
        name: 'Tanatat Juon',
        id: '62010346',
        info: 'Curabitur ac fringilla purus. Donec enim justo, blandit cursus lobortis non, lobortis ut velit. Ut eu consequat eros. Vivamus interdum pellentesque ligula, quis malesuada purus iaculis quis. Pellentesque ac ipsum pharetra, lacinia justo et, dignissim nulla. Nam diam augue, laoreet et dolor sit amet, suscipit placerat risus. In volutpat quam eget erat ultrices, vitae varius metus interdum.',
        imgSrc: 'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg',
    },
    {
        name: 'Nawapat Sriboonrueng',
        id: '62010472',
        info: 'Sed at feugiat nibh, et eleifend metus. Praesent ultrices felis et nisi gravida, id accumsan risus rutrum. Mauris a nibh dictum, rhoncus eros sit amet, pretium nibh. Phasellus sollicitudin nisi dictum vulputate semper. Suspendisse gravida rutrum odio. Nulla a nunc nunc. Donec pretium libero augue, sit amet gravida massa mollis vel. Sed a orci mi. In hac habitasse platea dictumst. Suspendisse ut enim consectetur, euismod tortor in, feugiat ante. Nunc lectus ipsum, tincidunt ut tincidunt in, blandit eu lectus.',
        imgSrc: 'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg',
    },
    {
        name: 'Nawapol Krudpun',
        id: '62010474',
        info: 'Maecenas venenatis facilisis semper. Praesent tellus turpis, laoreet ut venenatis vitae, bibendum ut erat. Vestibulum quis nunc et nisi hendrerit commodo. Duis suscipit nisi id leo placerat, in suscipit magna ultricies. Pellentesque nec condimentum orci. Suspendisse potenti. Donec varius orci nec eros malesuada, et hendrerit neque tincidunt.',
        imgSrc: 'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg',
    },
    {
        name: 'Phukphoom Taphrae',
        id: '62010609',
        info: 'Suspendisse laoreet volutpat sapien id egestas. Maecenas ut blandit felis. Donec imperdiet at tortor sed aliquet. Morbi eget velit pharetra, aliquet sapien sit amet, elementum dolor. Aliquam massa massa, porta eu ligula at, facilisis cursus dolor. Etiam gravida, ligula sed bibendum porta, neque ante dapibus nulla, vel porttitor dolor ante quis libero. Suspendisse feugiat dolor sed orci euismod iaculis. Curabitur sed libero eget sapien commodo faucibus et non lectus. Etiam quis arcu dignissim lectus mollis bibendum. Proin faucibus dapibus arcu sed lobortis. Donec vulputate quam felis, at venenatis enim aliquet nec. Nunc ut neque eros. Nulla tincidunt ipsum nec bibendum dignissim. Donec vitae dictum nisl. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam purus lacus, ullamcorper nec viverra vel, lacinia at nunc.',
        imgSrc: 'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg',
    },
];

const App = () => {
    return (
        <div className="flex flex-col items-center space-y" style={{ width: '100%' }}>
            <h1 style={{ color: 'yellow' }}>Group's Members</h1>
            {members.map((member) => {
                return <MemberCard name={member.name} id={member.id} info={member.info} imgSrc={member.imgSrc} key={member.id} />;
            })}
        </div>
    );
};

export default App;
